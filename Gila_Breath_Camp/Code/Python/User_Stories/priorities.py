# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : priorities.py
# PURPOSE        : Take data of applicant priorities from guardian
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 17-NOV-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	17-NOV-2016  	ROHAN SAWANT    		Started coding
# 2.0		20-NOV-2016		ROHAN SAWANT			Completed function getCustomerPriorities
# ================================================================================

import sys
import json
import ast
import datetime
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant

class Priorities(object):

	def getCustomerPriorities(self,front_end_str):
		""" get data for priorities from Customer """

		cf = common_functions.Common_functions()
		appl = applicant.Applicant()

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]

		data = cf.getFromCsv('applicant.csv',front_end_data)

		if data == []:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered"}'
		else:
			new_data = []
			list_of_names = ["NONE"]
			list_of_ssn = ["NONE"]

			for i in range(0,len(data)):
				name = data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name']
				if name not in list_of_names:
					list_of_names.append(data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name'])

			for j in range(0,len(data)):
				new_dict = {}
				new_dict['applicant_id'] = data[j]['applicant_id']
				new_dict['applicant_name'] = data[j]['applicant_last_name'] + ', ' + data[j]['applicant_first_name']
				new_dict['applicant_name_together_with'] = list_of_names
				new_dict['guardian_ssn_together_with'] = list_of_ssn
				new_dict['applicant_name_not_together_with'] = list_of_names
				new_dict['guardian_ssn_not_together_with'] = list_of_ssn
				new_data.append(new_dict)

			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict

	def getSsn(self,front_end_str):
		""" Get SSN for selected Name """

		front_end_dict = ast.literal_eval(front_end_str)

		together_flag = 1

		try:
			applicant_name = front_end_dict['data'][0]['applicant_name_together_with']

		except:
			applicant_name = front_end_dict['data'][0]['applicant_name_not_together_with']
			together_flag = 0

		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',{})

		if data == []:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered"}'
		else:
			new_data = [{}]
			list_of_ssn = []

			for i in range(0,len(data)):
				name = data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name']
				if name == applicant_name:
					ssn = data[i]['guardian_ssn']
					if ssn not in list_of_ssn:
						list_of_ssn.append(data[i]['guardian_ssn'])

		if together_flag == 1:
			new_data[0]['guardian_ssn_together_with'] = list_of_ssn
		else:
			new_data[0]['guardian_ssn_not_together_with'] = list_of_ssn

		if len(list_of_ssn) <=1:
			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"" }'
		else:
			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"There are more than 1 SSN\'s. | Please choose one of them from the dropdown" }'

		return return_front_end_dict



