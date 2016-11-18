# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : applicant.py
# PURPOSE        : Reading and Writing to "User.csv"
# AUTHOR         : JEMIN GOHIL, SOHEIL BOUZARI
# CREATION DATE  : 02-OCT-2016
# PENDING 		 :
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	02-OCT-2016  	JEMIN GOHIL, SOHEIL   	Added all functions, testing required
# 2.0		04-OCT-2016		JEMIN GOHIL			  	Added Transformation
# 3.0       10-OCT-2016     JEMIN GOHIL           	removed transformation from age & gender
# 4.0		13-OCT-2016		ROHAN SAWANT			Changed value of tribe_id and bunkhouse_id = 0
# 5.0		13-OCT-2016		ROHAN SAWANT			Added transformation to setAge
# 6.0		15-OCT-2016		ROHAN SAWANT			Added user_id getter-setter
# 7.0       19-OCT-2016		SOHEIL BOUZARI			Added .replace(" ","").isalpha(): ApplicantFirstName, ApplicantLastName, GuardianFirstName, GuardianLastName  
# ================================================================================

from datetime import datetime

class Applicant(object):

	def __init__(self):
		self.applicant_id = ''
		self.user_id = ''
		self.bunkhouse_id = ''
		self.tribe_id = ''
		self.camp_time_slots = ''
		self.applicant_first_name = ''
		self.applicant_last_name = ''
		self.applicant_age = ''
		self.applicant_gender = ''
		self.applicant_address = ''
		self.guardian_first_name = ''
		self.guardian_last_name = ''
		self.guardian_contact_number = ''
		self.guardian_address = ''
		self.application_date = ''
		self.emergency_contact = ''
		self.payment = ''
		self.medical_form = ''			
		self.legal_form = ''
		self.helmet = ''
		self.boot = ''
		self.sleeping_bag = ''
		self.water_bottle = ''
		self.sunscreen = ''
		self.bugs_spray = ''
		self.check_in_status = ''
		self.application_status = ''
		self.acceptance_packet = ''
		self.mailing_date = ''
		self.rejected_reason = ''
		self.guardian_ssn = ''

	
	def setApplicantId(self,applicant_id):
		self.applicant_id = applicant_id

	def getApplicantId(self):
		return self.applicant_id


	def setUserId(self,user_id):
		self.user_id = user_id

	def getUserid(self):
		return self.user_id


	def setBunkhouseId(self,bunkhouse_id):
		self.bunkhouse_id = bunkhouse_id

	def getBunkhouseId(self):
		return self.bunkhouse_id


	def setTribeId(self,tribe_id):
		self.tribe_id = tribe_id

	def getTribeId(self):
		return self.tribe_id


	def setCampTimeSlots(self,camp_time_slots):
		self.camp_time_slots = camp_time_slots

	def getCampTimeSlots(self):
		return self.camp_time_slots


	def setApplicantFirstName(self,applicant_first_name):
		applicant_first_name = applicant_first_name.strip()
		if applicant_first_name.replace(" ","").isalpha():
			self.applicant_first_name = applicant_first_name.upper()
		else:
			return "Camper First Name: Enter only alphabets"

	def getApplicantFirstName(self):
		return self.applicant_first_name


	def setApplicantLastName(self,applicant_last_name):
		applicant_last_name = applicant_last_name.strip()
		if applicant_last_name.replace(" ","").isalpha():
			self.applicant_last_name = applicant_last_name.upper()
		else:
			return "Camper Last Name: Enter only alphabets"

	def getApplicantLastName(self):
		return self.applicant_last_name


	def setApplicantAge(self,applicant_age):
		try:
			self.applicant_age = applicant_age.strip()
			self.applicant_age = int(applicant_age)
		except:
			return "Camper Age: Enter proper age"
	
	def getApplicantAge(self):
		return self.applicant_age


	def setApplicantGender(self,applicant_gender):
		self.applicant_gender = applicant_gender
		
	def getApplicantGender(self):
		return self.applicant_gender


	def setApplicantAddress(self,applicant_address):
		self.applicant_address = applicant_address.replace('\n',' ')

	def getApplicantAddress(self):
		return self.applicant_address


	def setGuardianFirstName(self,guardian_first_name):
		guardian_first_name = guardian_first_name.strip()
		if guardian_first_name.replace(" ","").isalpha():
			self.guardian_first_name = guardian_first_name.upper()
		else:
			self.guardian_first_name = ''
			return "Parent/Guardian First Name: Enter only alphabets"

	def getGuardianFirstName(self):
		return self.guardian_first_name


	def setGuardianLastName(self,guardian_last_name):
		guardian_last_name = guardian_last_name.strip()
		if guardian_last_name.replace(" ","").isalpha():
			self.guardian_last_name = guardian_last_name.upper()
		else:
			return "Parent/Guardian Last Name: Enter only alphabets"

	def getGuardianLastName(self):
		return self.guardian_last_name


	def setGuardianContactNumber(self,guardian_contact_number):
		guardian_contact_number = guardian_contact_number.strip()
		if (len(guardian_contact_number) == 10 and guardian_contact_number.isdigit()):
			self.guardian_contact_number = guardian_contact_number
		else:
			return "Parent/Guardian Contact Number: Enter 10 digits properly"

	def getGuardianContactNumber(self):
		return self.guardian_contact_number


	def setGuardianAddress(self,guardian_address):
		self.guardian_address = guardian_address.replace('\n',' ')

	def getGuardianAddress(self):
		return self.guardian_address


	def setApplicationDate(self,application_date):
		self.application_date = application_date

	def getApplicationDate(self):
		return self.application_date


	def setEmergencyContact(self,emergency_contact):
		emergency_contact = emergency_contact.strip()
		if (len(emergency_contact) == 10 and emergency_contact.isdigit()):
			self.emergency_contact = emergency_contact
		else:
			return "Emergency Contact: Enter 10 digits properly"

	def getEmergencyContact(self):
		return self.emergency_contact


	def setPayment(self,payment):
		self.payment = payment

	def getPayment(self):
		return self.payment


	def setMedicalForm(self,medical_form):
		self.medical_form = medical_form

	def getMedicalForm(self):
		return self.medical_form


	def setLegalForm(self,legal_form):
		self.legal_form = legal_form

	def getLegalForm(self):
		return self.legal_form


	def setHelmet(self,helmet):
		self.helmet = helmet

	def getHelmet(self):
		return self.helmet


	def setBoot(self,boot):
		self.boot = boot

	def getBoot(self):
		return self.boot


	def setSleepingBag(self,sleeping_bag):
		self.sleeping_bag = sleeping_bag

	def getSleepingBag(self):
		return self.sleeping_bag


	def setWaterBottle(self,water_bottle):
		self.water_bottle = water_bottle

	def getWaterBottle(self):
		return self.water_bottle


	def setSunscreen(self,sunscreen):
		self.sunscreen = sunscreen

	def getSunscreen(self):
		return self.sunscreen


	def setBugsSpray(self,bugs_spray):
		self.bugs_spray = bugs_spray

	def getBugsSpray(self):
		return self.bugs_spray


	def setCheckInStatus(self,check_in_status):
		self.check_in_status = check_in_status

	def getCheckInStatus(self):
		return self.check_in_status


	def setApplicationStatus(self,application_status):
		self.application_status = application_status

	def getApplicationStatus(self):
		return self.application_status


	def setAcceptancePacket(self,acceptance_packet):
		self.acceptance_packet = acceptance_packet

	def getAcceptancePacket(self):
		return self.acceptance_packet


	def setMailingDate(self,mailing_date):
		self.mailing_date = mailing_date

	def getMailingDate(self):
		return self.mailing_date


	def setRejectedReason(self,rejected_reason):
		self.rejected_reason = rejected_reason

	def getRejectedReason(self):
		return self.rejected_reason


	def setGuardianSsn(self,guardian_ssn):
		self.guardian_ssn = guardian_ssn

	def getGuardianSsn(self):
		return self.guardian_ssn

