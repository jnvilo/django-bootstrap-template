from django.urls import path
from django.views.generic import TemplateView
from .views import IndexView

urlpatterns = [

    path('base', TemplateView.as_view(template_name="bootstrap/base.html")),
    path('', TemplateView.as_view(template_name="bootstrap/index.html")),
    path('page-nav', TemplateView.as_view(template_name="bootstrap/page-nav.html")),


]