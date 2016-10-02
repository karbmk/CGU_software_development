# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : user.py
# PURPOSE        : Reading and Writing to "User.csv"
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 01-OCT-2016
# PENDING 		 : Adding getter-setter	for user_id
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	01-OCT-2016  	ROHAN SAWANT    		Added user_id, user_name
#
# ===============================================================================

class User(object):

	def __init__(self):	
		self.user_id = 0
		self.user_name = ''

	def setUserId(self,user_id):
		self.user_id = user_id

	def getUserId(self):
		return self.user_id

	def setUserName(self,user_name):
		self.user_name = user_name

	def getUserName(self):
		return self.user_name
