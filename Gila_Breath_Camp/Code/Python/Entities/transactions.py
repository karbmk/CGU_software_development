# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : transactions.py
# PURPOSE        : Reading and Writing to "User.csv"
# AUTHOR         : JEMIN GOHIL, SOHEIL BOUZARI
# CREATION DATE  : 01-OCT-2016
# PENDING 		 : Transformation
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	01-OCT-2016  	JEMIN GOHIL    		Added user_id, user_name
# 2.0       01-OCT-2016		SOHEIL BOUZARI      Added user_type, password
# ===============================================================================

class Transactions(object):

	def __init__(self):	
		self.transaction_id = 0
		self.user_id = ''
		self.applicant_id = ''
		self.bunkhouse_id = ''
		self.tribe_id = ''
											# Add Date and Time



	def setTransactionId(self,transaction_id):
		self.transaction_id = transaction_id

	def getTransactionId(self):
		return self.transaction_id



	def setUserId(self,user_id):
		self.user_id = user_id	

	def getUserId(self):
		return self.user_id




	def setApplicantId(self,applicant_id):
		self.applicant_id = applicant_id

	def getApplicantId(self):
		return self.applicant_id




	def setBunkhouseId(self,bunkhouse_id):
		self.bunkhouse_id = bunkhouse_id

	def getBunkhouseId(self):
		return self.bunkhouse_id




	def setTribeId(self,tribe_id):
		self.tribe_id = tribe_id	

	def getTribeId(self):
		return self.tribe_id	