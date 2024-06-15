from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register("", views.FeedbackView, basename='feedbackview')
router.register("question", views.QuestionView, basename='questionview')


urlpatterns = [
    path("", include(router.urls)),
]
