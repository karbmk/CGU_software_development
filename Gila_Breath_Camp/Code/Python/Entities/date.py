# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : date.py
# PURPOSE        : Reading and Writing to "date.csv"
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 15-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	15-OCT-2016  	ROHAN SAWANT    		Started coding
# 2.0   	15-OCT-2016  	ROHAN SAWANT    		Completed coding
# ================================================================================

class Date(object):

	def __init__  (self):
		self.date_id = ''
		self.camp_time_slots = ''


	def setDateId(self,date_id):
		self.date_id = date_id

	def getDateId(self):
		return self.date_id


	def setCampTimeSlots(self,camp_time_slots):
		self.camp_time_slots = camp_time_slots

	def getCampTimeSlots(self):
		return self.camp_time_slots


