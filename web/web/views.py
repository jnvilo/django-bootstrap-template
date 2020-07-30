from django.views import View
from django import http
from django import shortcuts

class BaseView(View):
    
    template_name = "base.html"
    def get(self, request, **kwargs):
        
        return shortcuts.render(request, self.template_name, )
    