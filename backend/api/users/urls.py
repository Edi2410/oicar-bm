from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register("user", views.UserView, basename='userview')
router.register("invite", views.InviteView, basename='inviteview')

urlpatterns = [
    path("", include(router.urls)),
]
