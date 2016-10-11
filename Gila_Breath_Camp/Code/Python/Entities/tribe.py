# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : tribe.py
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
# =====================================================================================


class Tribe(object):

	def __init__(self):	
		self.tribe_id = 0
		self.tribe_name = ''
		

	def setTribeId(self,tribe_id):
		self.tribe_id = tribe_id

	def getTribeId(self):
		return self.tribe_id



	def setTribeName(self,tribe_name):
		tribe_name = tribe_name.strip()				# Removing extra character from tribe
		if tribe_name.isalpha():
			self.tribe_name = tribe_name.upper()
		else: 
			return "Enter only alphabets"


	def getTribeName(self):
		return self.tribe_name
