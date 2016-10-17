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
import calendar
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import date

class Choose_date(object):

	def suffix(self,d):
		return 'th' if 11<=d<=13 else {1:'st',2:'nd',3:'rd'}.get(d%10, 'th')

	def returnSecondSunday(self,year,month):
		c = calendar.Calendar(firstweekday=calendar.MONDAY)
		date = c.monthdatescalendar(year,month)[1][6]
		return date

	def chooseDate(self,front_end_str):

		return_front_end_dict = ''

		cf = common_functions.Common_functions()
		dt = date.Date()

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]

		data = cf.getFromCsv('date.csv',front_end_data)

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }'
		else:
			self.returnSecondSunday(int(data[0]['year']),int(data[0]['month']))

			start_date = self.returnSecondSunday(int(data[0]['year']),int(data[0]['month']))
			end_date = start_date + datetime.timedelta(days=13)
			
			display_date = str(start_date.day) + self.suffix(start_date.day) + '-' + str(end_date.day) + self.suffix(end_date.day) + " " + start_date.strftime("%B") + " " + str(end_date.year)
			data[0]['display_date'] = display_date			
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"" }'

		return return_front_end_dict


