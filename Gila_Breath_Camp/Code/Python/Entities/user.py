# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : user.py
# PURPOSE        : Reading and Writing to "User.csv"
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 01-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	01-OCT-2016  	ROHAN SAWANT    		Added user_id, user_name
# 2.0       01-OCT-2016		JEMIN GOHIL             Added user_type, password
# 3.0       03-OCT-2016		JEMIN GOHIL             Transformation complete
# ================================================================================

class User(object):

	def __init__(self):	
		self.user_id = 0
		self.user_name = ''
		self.user_type = ''
		self.password = ''

	def setUserId(self,user_id):
		self.user_id = user_id

	def getUserId(self):
		return self.user_id

	def setUserName(self,user_name):
		self.user_name = user_name.strip()

	def getUserName(self):
		return self.user_name

	def setUserType(self,user_type):
		self.user_type = user_type

	def getUserType(self):
		return self.user_type

	def setPassword(self,password):
		if len(password) < 5:
			return "Password should be more than 5 characters"
		else: 
			self.password = password

	def getPassword(self):
		return self.password


