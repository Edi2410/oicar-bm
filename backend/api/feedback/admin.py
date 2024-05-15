from django.contrib import admin

from feedback.models import Feedback, Question, Score

# Register your models here.

class ScoreAdmin(admin.ModelAdmin):
    list_display = ('feedback', 'question', 'score',)  # Definira stupce koje želite prikazati u tablici

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('question', 'is_for_company')  # Definira stupce koje želite prikazati u tablici

class FeedbackAdmin(admin.ModelAdmin):
    list_display = ('feedback_from', 'feedback_to', 'is_from_company')  # Definira stupce koje želite prikazati u tablici


admin.site.register(Feedback, FeedbackAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Score, ScoreAdmin)
