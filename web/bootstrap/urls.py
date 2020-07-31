from django.urls import path
from django.views.generic import TemplateView
from .views import IndexView

class AboutView(TemplateView):
    template_name = "about.html"

urlpatterns = [
    path('', TemplateView.as_view(template_name="bootstrap/index.html")),
]