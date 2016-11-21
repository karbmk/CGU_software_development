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
# ================================================================================

import sys
import ast
import json
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
			data[0]['cancel_flag'] = '1'
			cf.updateManyRowIntoCsv('applicant.csv',data,'applicant_id')
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"Applicantion has been cancelled" }'

		return return_front_end_dict

	def setManyCancelFlag(self,front_end_str):
		""" set cancel at csv """

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data']
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',{})

		applicant_ids = []
		cancelled_data = []

		for i in range(0,len(front_end_data)):
			applicant_ids.append(front_end_data[i]['applicant_id'])

		for j in range(0,len(data)):
			if data[j]['applicant_id'] in applicant_ids:
				cancelled_data.append(data[j])

		if len(data) == 0:
			return_front_end_dict = '{ "data": "", "status":"error", "message":"Something went wrong" }'
		else:
			for k in range(0,len(cancelled_data)):
				cancelled_data[k]['cancel_flag'] = '1'
			cf.updateManyRowIntoCsv('applicant.csv',cancelled_data,'applicant_id')
			return_front_end_dict = '{ "data": "", , "status":"success", "message":"Application''s have been cancelled" }'

		return return_front_end_dict



