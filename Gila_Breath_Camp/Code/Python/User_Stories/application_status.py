# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : application_status.py
# PURPOSE        : Logic for getting the application status
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 16-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	16-OCT-2016  	ROHAN SAWANT    		Started coding
# 2.0   	16-OCT-2016  	ROHAN SAWANT    		Added logic for getApplicationStatus
# ================================================================================

import sys
import json
import ast
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant

class Application_status(object):

	def getApplicationStatus(self,front_end_str):

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',front_end_data)

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
		else:
			new_data = []

			for i in range(0,len(data)):
				dict = {}
				dict['applicant_id'] = data[i]['applicant_id']
				dict['applicant_first_name'] = data[i]['applicant_first_name']
				dict['applicant_last_name'] = data[i]['applicant_last_name']
				dict['acceptance_packet'] = data[i]['acceptance_packet']
				new_data.append(dict)

			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict


	def updateApplicationStatus(self,front_end_str):

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data']

		for i in range(0,len(front_end_data)):

			where_applicant_id = {}
			where_applicant_id['applicant_id'] = front_end_data[i]['applicant_id']
			
			cf = common_functions.Common_functions()

			data = cf.getFromCsv('applicant.csv',where_applicant_id)

			print(data[0])
			appl = applicant.Applicant(data[0])

			print(appl.getApplicantFirstName())

#		if len(data) == 0:
#			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
#		else:
#			new_data = []
#
#			for i in range(0,len(data)):
#				dict = {}
#				dict['applicant_id'] = data[i]['applicant_id']
#				dict['applicant_last_name'] = data[i]['applicant_last_name']
#				dict['acceptance_packet'] = data[i]['acceptance_packet']
#				new_data.append(dict)
#
#			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

#		return return_front_end_dict



