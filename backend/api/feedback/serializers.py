from users.serializers import UserSerializer
from feedback.models import Feedback, Question

from rest_framework import serializers


class FeedbackListSerializer(serializers.ModelSerializer):
    feedback_from = UserSerializer()
    feedback_to = UserSerializer()

    class Meta:
        model = Feedback
        fields = "__all__"


class FeedbackSerializer(serializers.ModelSerializer):
    class Meta:
        model = Feedback
        fields = "__all__"

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = "__all__"