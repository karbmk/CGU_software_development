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
		self.month = ''		
		self.year = ''


	def setDateId(self,date_id):
		self.date_id = date_id

	def getDateId(self):
		return self.date_id


	def setMonth(self,month):
		self.month = month

	def getMonth(self):
		return self.month


	def setYear(self,year):
		self.year = year

	def getYear(self):
		return self.year


