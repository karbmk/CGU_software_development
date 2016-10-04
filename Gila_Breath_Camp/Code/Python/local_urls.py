from django.conf.urls import url
import sys
sys.path.append("Python")
import views
#from . import views
urlpatterns = [
    url(r'^$', views.test, name='test'),
]