from django.shortcuts import render
from django.contrib.auth.models import User
from users.permissions import IsAdminOnEvent
from users.models import CompanyGroup, GoogleDriveLinks, UserData
from users.serializers import (
    GoogleDriveLinksSerializer,
    InviteUserSerializer,
    UserDataSerializer,
    UserSerializer,
)
from django.core.mail import send_mail
from django.template.loader import get_template

from rest_framework.decorators import action
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated


# Create your views here.
class UserView(viewsets.GenericViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]

    def list(self, request):
        try:
            user_data_queryset = UserData.objects.get(user__username=self.request.user)
            user_data_serializer = UserDataSerializer(user_data_queryset)
            folder_id = GoogleDriveLinks.objects.filter(
                group=user_data_serializer.data["group"]
            )
            folder_id_serializer = GoogleDriveLinksSerializer(folder_id, many=True)

            return_value = {
                "user": user_data_serializer.data["user"],
                "is_company": user_data_serializer.data["is_company"],
                "is_admin": user_data_serializer.data["is_admin"],
                "is_student": user_data_serializer.data["is_student"],
                "group": user_data_serializer.data["group"],
                "folder_id": folder_id_serializer.data if len(folder_id) > 0 else "",
            }
            return Response(return_value, status=status.HTTP_200_OK)
        except UserData.DoesNotExist:
            return Response(
                {
                    "error": "Podaci o korisniku nisu pronađeni. Javite se na it.podrska@estudent.hr"
                },
                status=status.HTTP_400_BAD_REQUEST,
            )
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(
        methods=["GET"],
        detail=False,
        url_path="for-feedback",
    )
    def get_user_to_give_feedback(self, request):
        try:
            user = UserData.objects.get(user__username=self.request.user)
            if user.is_admin:
                user_data_queryset = UserData.objects.all()
            elif user.is_student:
                user_data_queryset = UserData.objects.filter(is_company=True)
            else:
                user_data_queryset = UserData.objects.filter(is_student=True)

            user_data_serializer = UserDataSerializer(user_data_queryset, many=True)
            return Response(user_data_serializer.data, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)


class InviteView(viewsets.GenericViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated, IsAdminOnEvent]

    def create(self, request):
        try:
            serializer = InviteUserSerializer(data=request.data)
            serializer.is_valid(raise_exception=True)

            if User.objects.filter(email=serializer.data["email"]).exists():
                return Response(
                    {"message": "Korisnik s tim emailom već postoji"},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            password = User.objects.make_random_password()
            

            new_user = User.objects.create_user(
                email=serializer.data["email"],
                username=serializer.data["first_name"],
                first_name= serializer.data["first_name"] ,
                last_name = serializer.data.get("last_name", ""),
                password=password,
            )
            new_user.username = str(new_user.id) + new_user.first_name
            new_user.save()
            if serializer.data["is_company"]:
                user_data = UserData.objects.create(
                    user=new_user,
                    is_admin=serializer.data["is_admin"],
                    is_student=serializer.data["is_student"],
                    is_company=serializer.data["is_company"],
                    group=CompanyGroup.objects.get(group_name=serializer.data["group"]),
                )
            else:
                user_data = UserData.objects.create(
                    user=new_user,
                    is_admin=serializer.data["is_admin"],
                    is_student=serializer.data["is_student"],
                    is_company=serializer.data["is_company"],
                )

            user_data.save()

            message = get_template("email/invite.html").render(
                {
                    "first_name": new_user.first_name,
                    "username": new_user.username,
                    "password": password,
                }
            )
            send_mail(
                subject="Tvoj račun za Business Matchmaker feedback aplikaciju",
                message="",
                html_message=message,
                recipient_list=[new_user.email],
                from_email="BM app",
            )
            return Response({"message": "Korisnik pozvan"}, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response({"message": e}, status=status.HTTP_400_BAD_REQUEST)
