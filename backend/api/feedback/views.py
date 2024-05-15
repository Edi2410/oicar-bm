from users.models import UserData
from feedback.serializers import FeedbackListSerializer, FeedbackSerializer, QuestionSerializer
from feedback.models import Feedback, Question, Score

from django.db.models import Avg
from django.http import JsonResponse

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated


# Create your views here.
class FeedbackView(viewsets.GenericViewSet):
    queryset = Feedback.objects.all()
    serializer_class = FeedbackSerializer
    permission_classes = [IsAuthenticated]

    def list(self, request):
        try:
            return_grades = []
            user_data = UserData.objects.get(user=self.request.user)
            questions = Question.objects.exclude(is_for_company=user_data.is_company)

            for question in questions:         
                    scores = Score.objects.filter(feedback__feedback_to=self.request.user, question=question)
                    return_grades.append({
                        'question': question.question,
                        'grade': scores.aggregate(Avg('score'))['score__avg'] or 0
                    })

            feedback_comment = Feedback.objects.filter(feedback_to=self.request.user).values_list("comment")

            return_value = {
                'grades': return_grades,
                'comment': feedback_comment
            }
            
            return Response(return_value, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()

            scores = request.data.get('questions')

            for score in scores:
                Score.objects.create(
                    feedback=serializer.instance,
                    question=Question.objects.get(id=score['question']),
                    score=score['grade']
                )

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

class QuestionView(viewsets.GenericViewSet):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    permission_classes = [IsAuthenticated]

    def list(self, request):
        try:
            user_data = UserData.objects.get(user=self.request.user)
            if(user_data.is_admin):
                queryset = Question.objects.all();
            else:
                queryset = Question.objects.filter(is_for_company=user_data.is_company)
            serializer = QuestionSerializer(queryset, many=True)
            return Response( serializer.data, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)
