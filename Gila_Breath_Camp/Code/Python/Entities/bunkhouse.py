# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : bunkhouse.py
# PURPOSE        : Reading and Writing to "User.csv"
# AUTHOR         : JEMIN GOHIL, SOHEIL BOUZARI
# CREATION DATE  : 02-OCT-2016
# PENDING 		 : Transformation
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	02-OCT-2016  	JEMIN GOHIL, SOHEIL   Added bunkhouse_id, bunkhouse_name
# 
# ===================================================================================

class Bunkhouse(object):

	def __init__  (self):
		self.bunkhouse_id = 0
		self.bunkhouse_name = ''

	def setBunkhouseId(self,bunkhouse_id):
		self.bunkhouse_id = bunkhouse_id

	def getBunkhouseId(self):
		return self.bunkhouse_id

	def setBunkhouseName(self,bunkhouse_name):
		bunkhouse_name = bunkhouse_name.strip()
		if bunkhouse_name.isalpha():
			self.bunkhouse_name = bunkhouse_name.upper()
		else:
			return "Enter only alphabets"
				
	def getBunkhouseName(self):
		return self.bunkhouse_name

