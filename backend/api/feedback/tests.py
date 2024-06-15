from django.urls import reverse
from rest_framework.test import APITestCase, APIClient
from rest_framework import status
from django.contrib.auth.models import User
from users.models import UserData, CompanyGroup
from feedback.models import Feedback, Question, Score


class APITest(APITestCase):
    def setUp(self):
        self.user_data = {
            "username": "user1",
            "email": "user1@test.com",
            "password": "password1234",
        }
        self.admin_data = {
            "username": "admin",
            "email": "admin@test.com",
            "password": "admin1234",
        }

        self.admin_user = User.objects.create_superuser(**self.admin_data)
        self.client = APIClient()
        self.token_obtain_url = reverse("token_obtain_pair")
        self.feedback_url = reverse("feedbackview-list")
        self.feedback_question_url = reverse("questionview-list")
        self.invite_user_url = reverse("inviteview-list")
        self.user_url = reverse("userview-list")
        self.user_feedback_url = reverse("userview-get-user-to-give-feedback")

        self.admin_group = CompanyGroup.objects.create(group_name="A1")
        self.admin_userdata = UserData.objects.create(
            user=self.admin_user, is_admin=True, group=self.admin_group
        )

        self.user = User.objects.create_user(**self.user_data)
        self.user_data_obj = UserData.objects.create(
            user=self.user, is_student=True, group=self.admin_group
        )

        self.client.login(username="admin", password="admin1234")

    def get_user_token(self, is_admin=False):
        response = self.client.post(
            self.token_obtain_url, self.admin_data if is_admin else self.user_data
        )
        return response.data["access"]

    def test_get_feedback(self):
        token = self.get_user_token()
        self.client.credentials(HTTP_AUTHORIZATION="Bearer " + token)
        response = self.client.get(self.feedback_url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_post_feedback(self):
        token = self.get_user_token()
        self.client.credentials(HTTP_AUTHORIZATION="Bearer " + token)
        data = {
            "feedback_from": self.user.id,
            "feedback_to": self.admin_user.id,
            "comment": "Great work!",
            "is_from_company": False,
            "questions": [{"question": 1, "grade": 5}],
        }
        Question.objects.create(
            id=1, question="How was the service?", is_for_company=False
        )
        response = self.client.post(self.feedback_url, data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_get_feedback_question(self):
        token = self.get_user_token()
        self.client.credentials(HTTP_AUTHORIZATION="Bearer " + token)
        response = self.client.get(self.feedback_question_url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)