# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : choose_date.py
# PURPOSE        : Logic to Choose Date
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 15-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	15-OCT-2016  	ROHAN SAWANT    		Started coding
# ================================================================================

import json
import sys
import ast
import datetime
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import date

class Choose_date(object):

	def chooseDate(self,front_end_str):

		return_front_end_dict = ''

		cf = common_functions.Common_functions()
		dt = date.Date()

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]

		data = cf.getFromCsv('date.csv',front_end_data)

		start_date = datetime.datetime.strptime(data[0]['camp_time_slots'],"%Y-%m-%d %H:%M:%S.%f")
		end_date = start_date + datetime.timedelta(days=13)
		print(str(start_date.day) + '-' + str(end_date.day),start_date.strftime("%B"),str(end_date.year))
		print(cf.suffix(11))

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }'
		else:
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"" }'

		return return_front_end_dict


