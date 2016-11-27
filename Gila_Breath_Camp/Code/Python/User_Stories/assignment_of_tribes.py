# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : assignment_of_tribes.py
# PURPOSE        : Assign tribes to applicants
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 27-NOV-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	27-NOV-2016  	ROHAN SAWANT    		Started coding
# ===============================================================================

import ast
import json
import sys
sys.path.append("Python")
import common_functions

class Assignment_of_tribes(object):

	def readTribesData(self,front_end_str):
		""" read data for Tribes """

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		where = [{'camp_time_slots':str(front_end_data['camp_time_slots'])}]
		total_no_of_tribes = int(front_end_data['no_of_tribes'])

		cf = common_functions.Common_functions()
		data = cf.getAcceptedApplicants('{ "data": ' + json.dumps(where) + '}')

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
		else:
			male_data = []
			female_data = []

			for i in range(0,len(data)):
				if data[i]['applicant_gender'] == 'MALE':
					male_data.append(data[i])
				elif data[i]['applicant_gender'] == 'FEMALE':
					female_data.append(data[i])

			male_data_with_tribes = cf.sortData(male_data,'applicant_age')
			female_data_with_tribes = cf.sortData(female_data,'applicant_age')

			tribe_id = 1
			for k in range(0,len(male_data_with_tribes)): 
				male_data_with_tribes[k]['tribe_id'] = tribe_id
				tribe_id += 1
				if tribe_id == total_no_of_tribes + 1:
					tribe_id = 1

			for l in range(0,len(female_data_with_tribes)): 
				female_data_with_tribes[l]['tribe_id'] = tribe_id
				tribe_id += 1
				if tribe_id == total_no_of_tribes + 1:
					tribe_id = 1

			all_data = male_data_with_tribes + female_data_with_tribes

			return_front_end_dict = '{ "data": ' + json.dumps(all_data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict




