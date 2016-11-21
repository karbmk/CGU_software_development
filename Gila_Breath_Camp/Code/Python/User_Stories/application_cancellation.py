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
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',front_end_data)

		print(data)




