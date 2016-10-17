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
import datetime
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
			accept_status = 0
			total_accept_status_male = 0
			total_accept_status_female = 0

			for i in range(0,len(data)):

				accept_status = 0
				rejected_reason = ''

				print('total_accept_status_male :',total_accept_status_male)
				if total_accept_status_male >= 3:
					print('applicant id', data[i]['applicant_id'], 'rejected :', )
					accept_status = 0
					rejected_reason = 'SLOT IS FULL FOR MALE APPLICANTS'
				else:
					accept_status = 1

				if total_accept_status_female >= 3:
					print('applicant id', data[i]['applicant_id'], 'rejected :', )
					accept_status = 0
					rejected_reason = 'SLOT IS FULL FOR FEMALE APPLICANTS'
				else:
					accept_status = 1

				dict = {}
				dict['applicant_id'] = data[i]['applicant_id']
				dict['applicant_first_name'] = data[i]['applicant_first_name']
				dict['applicant_last_name'] = data[i]['applicant_last_name']
				
				age = int(data[i]['applicant_age'])
				if age >= 9 and age <=18 and accept_status != 0:
					accept_status = 1
					print('applicant_age')
				else:
					accept_status = 0
					rejected_reason = 'AGE IS NOT BETWEEN 9 TO 18'

				camp_date = datetime.datetime.strptime(data[i]['camp_time_slots'],"%Y-%m-%d %H:%M:%S.%f")
				application_date = datetime.datetime.strptime(data[i]['application_date'],"%Y-%m-%d %H:%M:%S.%f")
				camp_date_minus_2_month = cf.monthdelta(camp_date,-2)
				camp_date_minus_8_month = cf.monthdelta(camp_date,-8)

				#print('camp_date_minus_8_month',camp_date_minus_8_month)
				#print('application_date',application_date)
				#print('camp_date_minus_2_month',camp_date_minus_2_month)
				#print('accept_status',accept_status)

				if application_date >= camp_date_minus_8_month and application_date <=camp_date_minus_2_month and accept_status != 0:
					accept_status = 1
					print('application_date')					
				else:
					accept_status = 0
					rejected_reason = 'DATE FOR REGISTRATION HAS SURPASSED'

				if data[i]['payment'] != '' and accept_status != 0:
					payment = int(data[i]['payment'])
					if payment >= 1000:
						accept_status = 1
						print('payment')
					else:
						accept_status = 0
						rejected_reason = 'PAYMENT $' + str(payment) + ' IS LESS THAN $1000'
				else:
					accept_status = 0

				gender = data[i]['applicant_gender']
				if gender[0] == 'M' and accept_status == 1:
					print("gender :",gender)
					total_accept_status_male += 1					
				elif gender[0] == 'F' and accept_status == 1:
					total_accept_status_female += 1


				print(data[i]['applicant_id'],":",accept_status)
				#if age = int(data[i]['applicant_age'])

				dict['application_status'] = accept_status
				dict['acceptance_packet'] = data[i]['acceptance_packet']
				dict['rejected_reason'] = rejected_reason
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
				data[0]['mailing_date'] = str(datetime.datetime.now())
			elif front_end_data[i]['acceptance_packet'] == "0":
				data[0]['acceptance_packet'] = ""
				data[0]['mailing_date'] = ""

			data[0]['rejected_reason'] = front_end_data[i]['rejected_reason']

			app_dict.append(data[0])

		cf.updateManyRowIntoCsv('applicant.csv',app_dict,'applicant_id')

		return_front_end_dict = '{ "data": "", "status":"success", "message":"All applicant''s information updated" }'

		return return_front_end_dict




