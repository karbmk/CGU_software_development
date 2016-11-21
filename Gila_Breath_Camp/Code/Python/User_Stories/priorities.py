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

	def customerPriorities(self,front_end_str):
		""" Taking priorities from Customer """

		cf = common_functions.Common_functions()
		appl = applicant.Applicant()

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]

		data = cf.getFromCsv('applicant.csv',front_end_data)
		new_data = []
		list_of_names = []

		for i in range(0,range(len(data))):
			list_of_names.append(data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name'])

		for j in range(0,range(len(data))):
			new_dict = {}
			new_dict['applicant_id'] = data[j]['applicant_id']
			new_dict['applicant_name'] = data[j]['applicant_last_name'] + ', ' + data[j]['applicant_first_name']
			new_data.append(new_dict)

		new_data['applicant_name_together_with'] = list_of_names

		





