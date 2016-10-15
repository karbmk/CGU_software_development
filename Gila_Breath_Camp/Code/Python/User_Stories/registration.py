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
# ================================================================================

import sys
import ast
import datetime
sys.path.append("Python/Entities")
import applicant
import user

class Registration(object):

	def __init__(self,front_end_str):
		appl = applicant.Applicant()
		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		appl.setUserId(front_end_data['user_id'])
		appl.setCampTimeSlots(front_end_data['camp_time_slots'])
		appl.setApplicantFirstName(front_end_data['applicant_first_name'])
		appl.setApplicantLastName(front_end_data['applicant_last_name'])
		appl.setApplicantAge(front_end_data['applicant_age'])
		appl.setApplicantGender(front_end_data['applicant_gender'])
		appl.setApplicantAddress(front_end_data['applicant_address'])
		appl.setGuardianFirstName(front_end_data['guardian_first_name'])
		appl.setGuardianLastName(front_end_data['guardian_last_name'])
		appl.setGuardianContactNumber(front_end_data['guardian_contact_number'])
		appl.setGuardianAddress(front_end_data['guardian_address'])
		appl.setApplicationDate(str(datetime.datetime.now()))
		appl.setEmergencyContact(front_end_data['emergency_contact'])
		appl.setPayment(front_end_data['payment'])
		print(appl.__dict__)




