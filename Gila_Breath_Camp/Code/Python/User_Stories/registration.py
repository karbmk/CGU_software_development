# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : registration.py
# PURPOSE        : Logic for Registration
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 15-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	01-OCT-2016  	ROHAN SAWANT    		Started coding
# 2.0		15-OCT-2016		ROHAN SAWANT			First version of Registration User Story
# 3.0		20-NOV-2016		ROHAN SAWANT			Added alreadySsn function
# 4.0		30-NOV-2016		ROHAN SAWANT			Added viewRegisteredApplicant function
# ================================================================================

import sys
import json
import ast
import datetime
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant

class Registration(object):

	def register(self,front_end_str):

		cf = common_functions.Common_functions()
		appl = applicant.Applicant()

		error = []
		message = ''
		none = 0
		return_front_end_dict = ''

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		
		error.append(appl.setUserId(front_end_data['user_id']))
		error.append(appl.setCampTimeSlots(front_end_data['camp_time_slots']))
		error.append(appl.setApplicantFirstName(front_end_data['applicant_first_name']))
		error.append(appl.setApplicantLastName(front_end_data['applicant_last_name']))
		error.append(appl.setApplicantAge(front_end_data['applicant_age']))
		error.append(appl.setApplicantGender(front_end_data['applicant_gender']))
		error.append(appl.setApplicantAddress(front_end_data['applicant_address']))
		error.append(appl.setGuardianFirstName(front_end_data['guardian_first_name']))
		error.append(appl.setGuardianLastName(front_end_data['guardian_last_name']))
		error.append(appl.setGuardianContactNumber(front_end_data['guardian_contact_number']))
		error.append(appl.setGuardianAddress(front_end_data['guardian_address']))
		error.append(appl.setApplicationDate(str(datetime.datetime.now())))
		error.append(appl.setEmergencyContact(front_end_data['emergency_contact']))
		error.append(appl.setPayment(front_end_data['payment']))
		error.append(appl.setGuardianSsn(front_end_data['guardian_ssn']))
		#print(front_end_str)
		#print(error)

		for i in range(0,len(error)):
			if error[i] != None:
				if message == '':
					message = error[i]
				else:
					message = message + '|' + error[i]

		if message == '':
			cf.insertIntoCsv('applicant.csv',appl)
			emp_appl = applicant.Applicant()
			return_front_end_dict = '{ "data": [' + json.dumps(emp_appl.__dict__) + '], "status":"success", "message":"REGISTRATION COMPLETE" }'
		else:
			return_front_end_dict = '{ "data": [' + json.dumps(appl.__dict__) + '], "status":"error", "message":"' + message + '" }'

		return return_front_end_dict


	def alreadySsn(self,front_end_str):
		""" Showing data if already present for an SSN """

		cf = common_functions.Common_functions()
		appl = {'guardian_ssn':'','guardian_first_name':'','applicant_last_name':'','guardian_contact_number':'','emergency_contact':''}

		error = []
		message = ''
		none = 0
		return_front_end_dict = ''

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]

		ssn_data = cf.getFromCsv('applicant.csv',front_end_data)

		if ssn_data == []:
			return_front_end_dict = '{ "data": [], "status":"error", "message":"" }'
		else:
			key = len(ssn_data)-1
			appl['guardian_ssn'] = ssn_data[key]['guardian_ssn']
			appl['guardian_first_name'] = ssn_data[key]['guardian_first_name']
			appl['guardian_last_name'] = ssn_data[key]['guardian_last_name']
			appl['guardian_address'] = ssn_data[key]['guardian_address']
			appl['guardian_contact_number'] = ssn_data[key]['guardian_contact_number']
			appl['emergency_contact'] = ssn_data[key]['emergency_contact']

			return_front_end_dict = '{ "data": [' + json.dumps(appl) + '], "status":"success", "message":"WE ALREADY HAVE DATA FOR SSN : ' + ssn_data[0]['guardian_ssn'] + '|DO YOU WANT TO USE IT?"}'

		return return_front_end_dict


	def viewRegisteredApplicant(self,front_end_str):
		""" View Registered Applicant based on Application Id """
		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]

		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',front_end_data)

		if len(data) != 0:
			return_front_end_dict = '{ "data": [' + json.dumps(data) + '], "status":"success", "message":"DATA RETRIEVED" }'
		else:
			return_front_end_dict = '{ "data": [' + json.dumps(data) + '], "status":"success", "message":"THERE WAS SOME PROBLEM WHILE RETRIEVING DATA" }'

		return return_front_end_dict



