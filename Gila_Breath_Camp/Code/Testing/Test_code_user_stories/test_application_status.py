# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : test_application_status.py
# PURPOSE        : For testing application status
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 16-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	16-OCT-2016  	ROHAN SAWANT    		Started coding
# ================================================================================

import sys
sys.path.append("Python")
import common_functions
sys.path.append("Python/User_Stories")
import application_status
sys.path.append("Testing/Test_data_user_stories")
import csv

class Test_application_status(object):

	def getFromCsv(self,filename,where):
		""" Read to csv file """
		
		# Reading csv and storing data in List of List
		list_data = self.csvToListOfList('Test_data_user_stories/'+filename) 
		# Converting List of List to List of Dictionary
		list_dict_data = self.convertListToDict(list_data)
		list_dict_data_where = []
		
		if where == {}:
			# return all the data if there is no where clause defined
			list_dict_data_where = list_dict_data
		else:
			# find rows that match the where
			
			for i in range(0,len(list_dict_data)):
				dict = {}
				for columns in where:
					if list_dict_data[i][columns] == where[columns]:
						list_dict_data_where.append(list_dict_data[i])

		return list_dict_data_where

	def test_getApplicationStatus(self):
		""" testing function getApplicationStatus """
		
		appl_st = application_status.Application_status()
		
		data = self.getFromCsv('test_data_registration.csv',{})
		return_front_end_dict = '{ "data": ' + json.dumps(data) + '}'
		
		for i range(0,len(data)):
			out1 = appl_st.getApplicationStatus(return_front_end_dict)


	def test_updateApplicationStatus(self):
		appl_st = application_status.Application_status()
		appl_st.updateApplicationStatus()

		
	
	