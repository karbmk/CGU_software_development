from django.shortcuts import render

# Create your views here.
#from django.core.context_processors import csrf
from django.template.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
from django.http import HttpResponse
import sys
sys.path.append("Python")
sys.path.append("Python/Entities")
import common_functions
import user
import ast


def test(request):
	context = ""
	return render(request,'index.html',context)

@csrf_exempt
def create_volume(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print("data"+data)
	print(type(data))
	data_dict = ast.literal_eval(data)
	#print(data_dict["password"])
	#k = common_functions.Common_functions()
	#ur = user.User()
	#ur.setUserId(data_dict["user_id"])
	#ur.setUserName(data_dict["user_name"])
	#ur.setUserType(data_dict["user_type"])
	#if ur.setPassword(data_dict["password"]) == "Password should be more than 5 characters":
	#	return false
	#else:
	#	ur.setPassword(data_dict["password"])
	#k.insertIntoCsv("user.csv",ur)
	return HttpResponse("success",content_type="application/type")