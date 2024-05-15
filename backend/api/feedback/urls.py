from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register("", views.FeedbackView)
router.register("question", views.QuestionView)


urlpatterns = [
    path("", include(router.urls)),
]
