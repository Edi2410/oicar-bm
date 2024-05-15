from users.models import UserData
from rest_framework import permissions


class IsAdminOnEvent(permissions.BasePermission):
    def has_permission(self, request, view):
        if UserData.objects.get(user=request.user).is_admin:
            return True
        else:
            return False
