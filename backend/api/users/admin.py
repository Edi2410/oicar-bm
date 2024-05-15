from django.contrib import admin
from django.contrib.auth.models import Group

from users.models import UserData, GoogleDriveLinks, CompanyGroup

class GoogleDriveLinksAdmin(admin.ModelAdmin):
    list_display = ('group', 'folder_name', 'drive_link')  # Definira stupce koje želite prikazati u tablici

class CompanyGroupAdmin(admin.ModelAdmin):
    list_display = ('group_name',)  # Definira stupce koje želite prikazati u tablici

class UserDataAdmin(admin.ModelAdmin):
    list_display = ('user', 'group', 'is_company','is_admin','is_student')  # Definira stupce koje želite prikazati u tablici



# Register your models here.
admin.site.unregister(Group)
admin.site.register(UserData, UserDataAdmin)
admin.site.register(CompanyGroup, CompanyGroupAdmin)
admin.site.register(GoogleDriveLinks, GoogleDriveLinksAdmin)


