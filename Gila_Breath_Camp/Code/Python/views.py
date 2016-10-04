from django.shortcuts import render

# Create your views here.
#from django.core.context_processors import csrf
from django.template.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
from django.http import HttpResponse


def test(request):
	context = ""
	return render(request,'test.html',context)

@csrf_exempt
def create_volume(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print("data"+data)
	return HttpResponse("success",content_type="application/type")