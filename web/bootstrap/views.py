from django.shortcuts import render
from django import views
# Create your views here.


class IndexView(views.View):
    template_name = "index.html"
