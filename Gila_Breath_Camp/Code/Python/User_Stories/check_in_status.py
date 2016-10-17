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
		front_end_data = front_end_dict['data']

		cf = common_functions.Common_functions()

		app_dict = []

		for i in range(0,len(front_end_data)):

			where_applicant_id = {}
			where_applicant_id['applicant_id'] = front_end_data[i]['applicant_id']

			data = cf.getFromCsv('applicant.csv',where_applicant_id)

			data[0]['medical_form'] = front_end_data[i]['medical_form']
			data[0]['legal_form'] = front_end_data[i]['legal_form']
			data[0]['helmet'] = front_end_data[i]['helmet']
			data[0]['boot'] = front_end_data[i]['boot']
			data[0]['sleeping_bag'] = front_end_data[i]['sleeping_bag']
			data[0]['water_bottle'] = front_end_data[i]['water_bottle']
			data[0]['sunscreen'] = front_end_data[i]['sunscreen']
			data[0]['bugs_spray'] = front_end_data[i]['bugs_spray']
			data[0]['check_in_status'] = front_end_data[i]['check_in_status']
									
			app_dict.append(data[0])

		cf.updateManyRowIntoCsv('applicant.csv',app_dict,'applicant_id')

		return_front_end_dict = '{ "data": "", "status":"success", "message":"All applicant''s information updated" }'

		return return_front_end_dict

