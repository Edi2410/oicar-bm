from rest_framework import serializers
from users.models import UserData, GoogleDriveLinks

from django.contrib.auth.models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "username", "email", "first_name", "last_name"]


class InviteUserSerializer(serializers.ModelSerializer):
    group = serializers.CharField(required=False)
    is_admin = serializers.BooleanField()
    is_student = serializers.BooleanField()
    is_company = serializers.BooleanField()

    class Meta:
        model = User
        fields = [
            "email",
            "first_name",
            "last_name",
            "is_admin",
            "is_student",
            "is_company",
            "group",
        ]


class UserDataSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    class Meta:
        model = UserData
        fields = "__all__"


class GoogleDriveLinksSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoogleDriveLinks
        fields = "__all__"
