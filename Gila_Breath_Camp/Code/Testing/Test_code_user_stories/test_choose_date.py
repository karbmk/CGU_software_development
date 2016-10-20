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
# 2.0		16-OCT-2016		ROHAN SAWANT			Changed get date return logic
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

	def chooseDate(self):

		return_front_end_dict = ''

		cf = common_functions.Common_functions()
		dt = date.Date()

		date1 = {"date_id":"1"}
		date2 = {"date_id":"2"}
		date3 = {"date_id":"3"}

		data1 = cf.getFromCsv('date.csv',date1)	
		data2 = cf.getFromCsv('date.csv',date2)	
		data3 = cf.getFromCsv('date.csv',date3)		

		if len(data1) == 0:
			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }'
		elif len(data2) == 0:
			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }'
		elif len(data3) == 0:
			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }'
		else:
			start_date1 = self.returnSecondSunday(int(data1[0]['year']),int(data1[0]['month']))
			start_date2 = self.returnSecondSunday(int(data2[0]['year']),int(data2[0]['month']))
			start_date3 = self.returnSecondSunday(int(data3[0]['year']),int(data3[0]['month']))

			new_data = [{}]

			new_data[0]['camp_time_slots1'] = str(start_date1) + " 00:00:00.000000"
			new_data[0]['camp_time_slots2'] = str(start_date2) + " 00:00:00.000000"
			new_data[0]['camp_time_slots3'] = str(start_date3) + " 00:00:00.000000"

			end_date1 = start_date1 + datetime.timedelta(days=13)
			end_date2 = start_date2 + datetime.timedelta(days=13)
			end_date3 = start_date3 + datetime.timedelta(days=13)
			
			display_date1 = str(start_date1.day) + self.suffix(start_date1.day) + '-' + str(end_date1.day) + self.suffix(end_date1.day) + " " + start_date1.strftime("%B") + " " + str(end_date1.year)
			display_date2 = str(start_date2.day) + self.suffix(start_date2.day) + '-' + str(end_date2.day) + self.suffix(end_date2.day) + " " + start_date2.strftime("%B") + " " + str(end_date2.year)
			display_date3 = str(start_date3.day) + self.suffix(start_date3.day) + '-' + str(end_date3.day) + self.suffix(end_date3.day) + " " + start_date3.strftime("%B") + " " + str(end_date3.year)

			new_data[0]['display_date1'] = display_date1
			new_data[0]['display_date2'] = display_date2
			new_data[0]['display_date3'] = display_date3

			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"" }'

		return return_front_end_dict


