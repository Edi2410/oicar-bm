from django.contrib import admin
from django.contrib.auth.models import Group

from user.models import UserData, GoogleDriveLinks, CompanyGroup

admin.site.unregister(Group)
admin.site.register(UserData)
admin.site.register(CompanyGroup)
admin.site.register(GoogleDriveLinks)