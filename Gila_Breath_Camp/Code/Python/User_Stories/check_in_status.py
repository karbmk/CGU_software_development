# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : check_in_status.py
# PURPOSE        : Logic for Check In
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 15-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	15-OCT-2016  	ROHAN SAWANT    		Started coding
# 2.0   	15-OCT-2016  	ROHAN SAWANT    		Completed
# ================================================================================

import sys
import ast
import json
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant

class Check_in_status(object):

	def getCheckInStatus(self,front_end_str):

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',front_end_data)

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
		else:
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict

	def insertCheckInStatus(self,front_end_str):

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',front_end_data)

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
		else:
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict
