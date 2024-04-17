from django.db import models
from django.contrib.auth.models import User

class CompanyGroup(models.Model):
    group_name = models.CharField(max_length=2)

    def str(self) -> str:
        return f"{self.group_name}"


class UserData(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    group = models.ForeignKey(
        CompanyGroup, on_delete=models.CASCADE, blank=True, null=True
    )
    is_company = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    is_student = models.BooleanField(default=False)

    def str(self) -> str:
        return f"{self.user.email} - {'COMPANY' if self.is_company else ''} - {'ADMIN' if self.is_admin else ''} - {'- STUDENT' if self.is_student else ''}"

class GoogleDriveLinks(models.Model):
    group = models.ForeignKey(CompanyGroup, on_delete=models.CASCADE)
    folder_name = models.CharField(max_length=100, blank=True, null=True)
    drive_link = models.CharField(max_length=500)

    def str(self) -> str:
        return f"{self.group.group_name} - {self.drive_link}"