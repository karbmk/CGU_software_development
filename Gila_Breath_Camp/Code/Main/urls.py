"""Code URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from Python import views

urlpatterns = [
    url(r'^Python/', include('Python.local_urls')),
    url(r'^registration_ui/', views.registration_ui, name='registration_ui'),
	url(r'^test_js/', views.test_js, name='test_js'),
	url(r'^test_js_get_appl/', views.test_js_get_appl, name='test_js_get_appl'),
	url(r'^application_status_send/', views.application_status_send, name='application_status_send'),
	url(r'^application_status_get/', views.application_status_get, name='application_status_get'),
	url(r'^test_submit_checkin/', views.test_submit_checkin, name='test_submit_checkin'),

]
