# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      :  application_status.py
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
import datetime
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant

class Application_status(object):

	def isApplicationDateNotInRange(self,application_date,camp_date):
		""" checks whether the application date has surpassed or not """

		cf = common_functions.Common_functions()
		camp_date_minus_2_month = cf.monthdelta(camp_date,-2)
		camp_date_minus_8_month = cf.monthdelta(camp_date,-8)	

		if application_date >= camp_date_minus_8_month and application_date <=camp_date_minus_2_month:
			return False					
		else:
			return True

	def isSlotNotAvailable(self,accepted_count,gender):
		""" checks slots for male and female are available  """

		if accepted_count[gender] <= 36:
			return False					
		else:
			return True

	def isAgeNotInRange(self,age):
		""" checks whether the age of applicant in between 8 and 19 """

		if age >= 9 and age <=18:
			return False
		else:
			return True

	def isPaymentNotCorrect(self,payment):
		""" checks whether payment is correct (1000$ or more) """

		if payment >= 1000:
			return False
		else:
			return True

	def getApplicationStatus(self,front_end_str):

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		
		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',front_end_data)

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
		else:
			
			new_data = []
			accepted_count = {'MALE':0,'FEMALE':0}

			for i in range(0,len(data)):

				dict = {}
				violations = []
				slot = 36
				applicant_status = 0
				
				# data about the applicant
				camp_date = datetime.datetime.strptime(data[i]['camp_time_slots'],"%Y-%m-%d %H:%M:%S.%f")	
				application_date = datetime.datetime.strptime(data[i]['application_date'],"%Y-%m-%d %H:%M:%S.%f")
				gender = data[i]['applicant_gender']
				age = int(data[i]['applicant_age'])
				payment = int(data[i]['payment'])	

				if self.isApplicationDateNotInRange(application_date,camp_date):
					violations.append('DATE OF REGISTRATION HAS SURPASSED')

				if self.isSlotNotAvailable(accepted_count,gender):
					violations.append(gender + ' SLOTS ARE FULL')

				if self.isAgeNotInRange(age):
					violations.append('AGE IS NOT BETWEEN 8 AND 19')

				if self.isPaymentNotCorrect(payment):
					violations.append(str(payment) + '$ IS LESS THAN 1000$')

				if len(violations) == 0:
					accepted_count[gender] += 1
					applicant_status = 1
					violations = ('NO VIOLATIONS')

				dict['applicant_id'] = data[i]['applicant_id']
				dict['applicant_first_name'] = data[i]['applicant_first_name']
				dict['applicant_last_name'] = data[i]['applicant_last_name']
				dict['application_status'] = applicant_status
				dict['acceptance_packet'] = data[i]['acceptance_packet']
				dict['rejected_reason'] = violations
				
				new_data.append(dict)

			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict


	def updateApplicationStatus(self,front_end_str):

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data']
		cf = common_functions.Common_functions()

		app_dict = []

		for i in range(0,len(front_end_data)):

			where_applicant_id = {}
			where_applicant_id['applicant_id'] = front_end_data[i]['applicant_id']

			data = cf.getFromCsv('applicant.csv',where_applicant_id)
			print(data)

			if front_end_data[i]['acceptance_packet'] == "1":
				data[0]['acceptance_packet'] = front_end_data[i]['acceptance_packet']
				if data[0]['mailing_date'] == "":
					data[0]['mailing_date'] = str(datetime.datetime.now())
			elif front_end_data[i]['acceptance_packet'] == "0":
				data[0]['acceptance_packet'] = ""
				data[0]['mailing_date'] = ""

			if front_end_data[i]['application_status'][0] == "A":
				data[0]['application_status'] = "1"
			elif front_end_data[i]['application_status'][0] == "R":
				data[0]['application_status'] = "0"

			data[0]['rejected_reason'] = front_end_data[i]['rejected_reason']

			app_dict.append(data[0])

		cf.updateManyRowIntoCsv('applicant.csv',app_dict,'applicant_id')

		return_front_end_dict = '{ "data": "", "status":"success", "message":"All applicant''s information updated" }'

		return return_front_end_dict




