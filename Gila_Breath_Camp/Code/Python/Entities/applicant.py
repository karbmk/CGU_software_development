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
# ================================================================================

from datetime import datetime

class Applicant(object):

	def __init__(self):
		self.applicant_id = 0
		self.first_name = ''
		self.last_name = ''
		self.guardian_first_name = ''
		self.guardian_last_name = ''
		self.guardian_contact_number = ''
		self.application_date = ''
		self.emergency_contact = ''
		self.age = 0
		self.gender = ''
		self.address = ''
		self.legal_form = ''
		self.medical_form = ''
		self.bunkhouse_id = 0		
		self.tribe_id = 0
		self.helmet = ''
		self.boot = ''
		self.sleeping_bag = ''
		self.water_bottle = ''
		self.sunscreen = ''
		self.bugs_spray = ''
	

	def setApplicantId(self,applicant_id):
		self.applicant_id = applicant_id

	def getApplicantId(self):
		return self.applicant_id


	def setLastName(self,last_name):
		last_name = last_name.strip()
		if last_name.isalpha():
			self.last_name = last_name.upper()
		else:
			return "Enter only alphabets"

	def getLastName(self):
		return self.last_name


	def setFirstName(self,first_name):
		first_name = first_name.rstrip()
		if first_name.isalpha():
			self.first_name = first_name.upper()
		else:
			return "Enter only alphabets"

	def getFirstName(self):
		return self.first_name


	def setGuardianFirstName(self,guardian_first_name):
		guardian_first_name = guardian_first_name.strip()
		if guardian_first_name.isalpha():
			self.guardian_first_name = guardian_first_name.upper()
		else:
			return "Enter only alphabets"

	def getGuardianFirstName(self):
		return self.guardian_first_name


	def setGuardianLastName(self,guardian_last_name):
		guardian_last_name = guardian_last_name.strip()
		if guardian_last_name.isalpha():
			self.guardian_last_name = guardian_last_name.upper()
		else:
			return "Enter only alphabets"

	def getGuardianLastName(self):
		return self.guardian_last_name


	def setGuardianContactNumber(self,guardian_contact_number):
		guardian_contact_number = guardian_contact_number.strip()
		if (len(guardian_contact_number) == 10 and guardian_contact_number.isdigit()):
			self.guardian_contact_number = guardian_contact_number
		else:
			return "Enter 10 digits properly"

	def getGuardianContactNumber(self):
		return self.guardian_contact_number

	def setApplicationDate(self,application_date):
		try: 
			date = datetime.strptime(application_date, '%m-%d-%Y')
			self.application_date = date

		except:
			return "Enter proper Date"


	def getApplicationDate(self):
		return self.application_date


	def setEmergencyContact(self,emergency_contact):
		emergency_contact = emergency_contact.strip()
		if (len(emergency_contact) == 10 and emergency_contact.isdigit()):
			self.emergency_contact = emergency_contact
		else:
			return "Enter 10 digits properly"

	def getEmergencyContact(self):
		return self.emergency_contact


	def setAge(self,age):
		try:
			self.age = age.strip()
			self.age = int(age)
		except:
			self.age = ''
			return "Enter an integer"

		
	def getAge(self):
		return self.age


	def setGender(self,gender):
		self.gender = gender
		
	def getGender(self):
		return self.gender


	def setAddress(self,address):
		self.address = address

	def getAddress(self):
		return self.address


	def setLegalForm(self,legal_form):
		self.legal_form = legal_form

	def getLegalForm(self):
		return self.legal_form


	def setMedicalForm(self,medical_form):
		self.medical_form = medical_form

	def getMedicalForm(self):
		return self.medical_form


	def setBunkhouseId(self,bunkhouse_id):
		self.bunkhouse_id = bunkhouse_id

	def getBunkhouseId(self):
		return self.bunkhouse_id


	def setTribeId(self,tribe_id):
		self.tribe_id = tribe_id

	def getTribeId(self):
		return self.tribe_id


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
