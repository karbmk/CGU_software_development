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
from django.http import HttpResponseForbidden
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
import priorities
import application_cancellation
import printing_of_acceptance_or_rejection_notice

def test(request):
	context = ""
	return render(request,'index.html',context)

@csrf_exempt
def registration_ui(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	print("data"+data)
	try:
		regis = registration.Registration()
		st = regis.register(data)
	except Exception as e:
		st = e
	return HttpResponse(st,content_type="application/type")

@csrf_exempt
def already_ssn(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["ssn"]
	front_end_str10 = json.dumps({"data" :[{"guardian_ssn":"342-909-8982"}]})
	try:
		regis = registration.Registration()
		st = regis.alreadySsn(data)
	except Exception as e:
		st = e
	return HttpResponse(st,content_type="application/type")


@csrf_exempt
def priorities_get(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["prior"]
	print(data)
	dt = choose_date.Choose_date()
	st = dt.chooseDate()
	camp_slot = ''
	cis = check_in_status.Check_in_status()
	if json.loads(data)["data"][0]["date_id"]=="1":
		camp_slot = json.loads(st)["data"][0]["camp_time_slots1"]
	elif json.loads(data)["data"][0]["date_id"]=="2":
		camp_slot = json.loads(st)["data"][0]["camp_time_slots2"]
	elif json.loads(data)["data"][0]["date_id"]=="3":
		camp_slot = json.loads(st)["data"][0]["camp_time_slots3"]
	st_get = cis.getCheckInStatus('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}')
	print(camp_slot)
	front_end_str111 = '{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}'
	pr = priorities.Priorities()
	st = pr.getCustomerPriorities(front_end_str111)
	return HttpResponse(st,content_type="application/type")

@csrf_exempt
def priorities_get_guar_ssn(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["prior"]
	print(data)
	pr = priorities.Priorities()
	st = pr.getSsn(data)
	return HttpResponse(st,content_type="application/type")

@csrf_exempt
def print_letter(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["ssn"]
	prin_letter = printing_of_acceptance_or_rejection_notice.Notice()
	st = prin_letter.acceptance(data)
	return HttpResponse(st,content_type="application/type")

@csrf_exempt
def send_cancel(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	apps = application_cancellation.Application_cancellation()
	st = apps.setManyCancelFlag(data)
	print(st)
	return HttpResponse(st,content_type="application/type")


@csrf_exempt	
def test_js(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	try:
		dt = choose_date.Choose_date()
		st = dt.chooseDate()
		camp_slot = ''
		cis = check_in_status.Check_in_status()
		if json.loads(data)["data"][0]["date_id"]=="1":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots1"]
		elif json.loads(data)["data"][0]["date_id"]=="2":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots2"]
		elif json.loads(data)["data"][0]["date_id"]=="3":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots3"]
		st_get = cis.getCheckInStatus('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}')
	except Exception as e:
		st_get = e
	return HttpResponse(st_get,content_type="application/type")

@csrf_exempt	
def test_js_get_appl(request):
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	try:
		dt = choose_date.Choose_date()
		st = dt.chooseDate()
		print(st)
		cis = application_status.Application_status()
		if json.loads(data)["data"][0]["date_id"]=="1":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots1"]
		elif json.loads(data)["data"][0]["date_id"]=="2":
			camp_slot = json.loads(st)["data"][0]["camp_time_slots2"]
		elif json.loads(data)["data"][0]["date_id"]=="3":
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
	c = {}
	c.update(csrf(request));
	data = request.POST["vol_name"]
	try:
		a = application_status.Application_status()
		st = a.updateApplicationStatus(data)
	except Exception as e:
		st = e
	return HttpResponse(st,content_type="application/type")

def application_status_get(request):
	try:
		dt = choose_date.Choose_date()
		st = dt.chooseDate()
	except Exception as e:
		st = e
	return HttpResponse(st,content_type="application/type")


