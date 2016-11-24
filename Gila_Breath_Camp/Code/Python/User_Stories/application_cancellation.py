# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : application_cancellation.py
# PURPOSE        : Logic to cancel an application of an applicant
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 23-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	23-OCT-2016  	SOHEIL BOUZARI    		Started coding
# 2.0   	23-NOV-2016  	JEMIN GOHIL     		Completed cancellation, refund left
# ================================================================================

import sys
import ast
import json
import datetime
sys.path.append("Python")
import common_functions

class Application_cancellation(object):

	def getApplicationCancellation(self,front_end_str):
		""" get data for accepted applicants """

		cf = common_functions.Common_functions()
		data = cf.getAcceptedApplicants(front_end_str)

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
		else:
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict
		
	def setCancelFlag(self,front_end_str):
		""" set cancel at csv """

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		where = {'applicant_id': str(front_end_data['applicant_id'])}
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',where)

		if len(data) == 0:
			return_front_end_dict = '{ "data": "", "status":"error", "message":"Something went wrong" }'
		
		else:
			data[0]['cancel_flag'] = '0'
			cf.updateManyRowIntoCsv('applicant.csv',data,'applicant_id')
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"Applicantion has been cancelled" }'
			

		#print('return_front_end_dict;',return_front_end_dict)		
		return return_front_end_dict

	def setManyCancelFlag(self,front_end_str):
		""" set cancel at csv """

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data']
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',{})

		applicant_ids = []
		new = []


		for i in range(0,len(front_end_data)):
			applicant_ids.append(front_end_data[i]['applicant_id'])
			#print(applicant_ids)
		for j in range(0,len(data)):
			if data[j]['applicant_id'] in applicant_ids:
				new.append(data[j])

		#print (len(new))

		for k in range(0,len(new)):
			for i in range(0,len(front_end_data)):
				if new[k]["applicant_id"] == front_end_data[i]["applicant_id"]:
					new[k]["cancel_flag"] = front_end_data[i]["cancel_flag"]


		for l in range(0,len(new)):
			if new[l]["cancel_flag"] == '1':
				new[l]["cancel_date"] = str(datetime.datetime.now())
				print('new[l]["cancel_date"]:',new[l]["cancel_date"])
					#getRefund(new[l]["payment"],new[l]["mailing_date"],new[l]["cancel_date"])
				new[l]["refund"] = self.getRefund(new[l]["payment"],new[l]["mailing_date"],new[l]["cancel_date"])
				print(new[l]["refund"])
		
		cf.updateManyRowIntoCsv('applicant.csv',new,'applicant_id')
		return_front_end_dict = '{ "data": ' + json.dumps(new) + ', "status":"success", "message":"Application has been updated" }'
		return return_front_end_dict
		
	def getRefund(self,payment,mailing_date,cancel_date):
		
		"""Set Refund at csv"""
		cf = common_functions.Common_functions()
		mail = cf.str_to_date(mailing_date)
		print('cancel_date:',cancel_date)
		cancel = cf.str_to_date(cancel_date)
		print(mail)
		print(cancel_date)
		#if week_difference 
		return "100"

		#for i in range(0,len(new)):
			#if new[i]["cancel_flag"] == '1'
			#refunds.append()"""

