from django.db import models
from django.contrib.auth.models import User

class Feedback(models.Model):
    feedback_from = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="feedback_from"
    )
    feedback_to = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="feedback_to"
    )
    comment = models.TextField(null=True, blank=True)
    is_from_company = models.BooleanField(default=False)

    def str(self) -> str:
        return f"from: {self.feedback_from.username} - for: {self.feedback_to.username}"


class Question(models.Model):
    question = models.TextField()
    is_for_company = models.BooleanField(default=False)

    def str(self) -> str:
        return f"{'(company)' if self.is_for_company else ''}  {self.question}"

class Score(models.Model):
    feedback = models.ForeignKey(Feedback, on_delete=models.CASCADE)
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    score = models.IntegerField()

    def str(self) -> str:
        return f"{self.feedback.feedback_to.first_name} - {self.question} - {self.score}"