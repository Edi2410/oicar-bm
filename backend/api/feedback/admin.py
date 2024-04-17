from django.contrib import admin
from feedback.models import Feedback, Question, Score

admin.site.register(Feedback)
admin.site.register(Question)
admin.site.register(Score)
