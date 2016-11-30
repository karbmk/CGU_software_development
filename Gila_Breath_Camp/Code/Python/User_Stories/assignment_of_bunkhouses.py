# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : assignment_of_bunkhouses.py
# PURPOSE        : Assign bunkhouses to applicants
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 26-NOV-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	26-NOV-2016  	ROHAN SAWANT    		Started coding
# ===============================================================================

import ast
import json
import sys
sys.path.append("Python")
import common_functions

class Assignment_of_bunkhouses(object):

	def readBunkhouseData(self,front_end_str):
		""" read data for Bunkhouse """

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		where = [{'camp_time_slots':str(front_end_data['camp_time_slots'])}]
		total_no_of_bunkhouses = int(front_end_data['no_of_bunkhouses'])
		no_of_male_bunkhouses = total_no_of_bunkhouses/2
		no_of_female_bunkhouses = total_no_of_bunkhouses

		cf = common_functions.Common_functions()
		data = cf.getCheckedInApplicants('{ "data": ' + json.dumps(where) + '}')

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

			male_data_with_bunkhouses = cf.sortData(male_data,'applicant_age')
			female_data_with_bunkhouses = cf.sortData(female_data,'applicant_age')

			bunkhouse_id = 1
			for k in range(0,len(male_data_with_bunkhouses)): 
				male_data_with_bunkhouses[k]['bunkhouse_id'] = bunkhouse_id
				bunkhouse_id += 1
				if bunkhouse_id == no_of_male_bunkhouses + 1:
					bunkhouse_id = 1

			bunkhouse_id = no_of_male_bunkhouses + 1
			for l in range(0,len(female_data_with_bunkhouses)): 
				female_data_with_bunkhouses[l]['bunkhouse_id'] = bunkhouse_id
				bunkhouse_id += 1
				if bunkhouse_id == no_of_female_bunkhouses + 1:
					bunkhouse_id = no_of_male_bunkhouses + 1

			all_data = male_data_with_bunkhouses + female_data_with_bunkhouses
			cf.updateManyRowIntoCsv('applicant.csv',all_data,'applicant_id')

			return_front_end_dict = '{ "data": ' + json.dumps(all_data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict





