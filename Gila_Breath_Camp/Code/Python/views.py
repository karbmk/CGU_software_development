# =================================================================================================
#                             GILA BREATH CAMP
#
# =================================================================================================
# =================================================================================================
# FILE NAME      : views.py
# PURPOSE        : Connection between all the python modules and the front end
# AUTHOR         : KARTHIK MANJUNATH
# CREATION DATE  : 02-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------------------------
# 1.0   	02-OCT-2016  	KARTHIK MANJUNATH    		Started basic structure
# 2.0   	12-OCT-2016  	KARTHIK MANJUNATH   		Added logic for registration with front end
# 3.0   	15-OCT-2016  	KARTHIK MANJUNATH    		Added logic for check-in with front end
# 4.0   	17-OCT-2016  	KARTHIK MANJUNATH    		Added logic for application status with
#														front end and code clean up or refactoring
# =================================================================================================

from django.shortcuts import render
from django.template.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
import sys
sys.path.append("Python")
sys.path.append("Python/Entities")
import common_functions
import user
import ast
import json
sys.path.append("Python/User_Stories")
import registration
import choose_date
import check_in_status
import application_status

def test(request):
	context = ""
	return render(request,'index.html',context)

@csrf_exempt
def create_volume(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print("data"+data)
	try:
		regis = registration.Registration()
		st = regis.register(data)
		print(type(st))
	except Exception as e:
		st = e
		print(st)
	return HttpResponse(st,content_type="application/type")

@csrf_exempt	
def test_js(request):
	print ("in python")
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print((json.loads(data)["data"][0]["date_id"]))
	try:
		dt = choose_date.Choose_date()
		st = dt.chooseDate()
		print(st)
		cis = check_in_status.Check_in_status()
		if json.loads(data)["data"][0]["date_id"]=="1":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots1"]
		elif json.loads(data)["data"][0]["date_id"]=="2":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots2"]
		else:
			camp_slot = json.loads(st)["data"][0]["camp_time_slots3"]
		print('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}')
		st_get = cis.getCheckInStatus('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}')
		print(st_get)
	except Exception as e:
		st_get = e
		print(st_get)
	return HttpResponse(st_get,content_type="application/type")

@csrf_exempt	
def test_js_get_appl(request):
	print ("in python")
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print("data"+data)
	try:
		dt = choose_date.Choose_date()
		st = dt.chooseDate()
		print(st)
		cis = application_status.Application_status()
		if json.loads(data)["data"][0]["date_id"]=="1":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots1"]
		elif json.loads(data)["data"][0]["date_id"]=="2":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots2"]
		else:
			camp_slot = json.loads(st)["data"][0]["camp_time_slots3"]
		st_get = cis.getApplicationStatus('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}')
		print(st_get)
	except Exception as e:
		st_get = e
		print(st_get)
	return HttpResponse(st_get,content_type="application/type")


@csrf_exempt	
def test_submit_checkin(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print("data"+data)
	try:
		dt = choose_date.Choose_date()
		st = dt.chooseDate()
		print(st)
		cis = check_in_status.Check_in_status()
		st_get = cis.updateCheckInStatus(data)#json.dumps({"data" :[{"camp_time_slots":"2016-10-15 00:00:00.000000"}]}))
		print(st_get)
	except Exception as e:
		st_get = e
		print(st_get)
	return HttpResponse(st_get,content_type="application/type")

@csrf_exempt
def application_status_send(request):
	print("in application_status")
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print(data)
	try:
		a = application_status.Application_status()
		print("in try")
		st = a.updateApplicationStatus(data)
		print(st)
	except Exception as e:
		st = e
		print(e)
	return HttpResponse(st,content_type="application/type")

def application_status_get(request):
	try:
		dt = choose_date.Choose_date()
		st = dt.chooseDate()
		print(st)
	except Exception as e:
		st = e
		print(e)
	return HttpResponse(st,content_type="application/type")


