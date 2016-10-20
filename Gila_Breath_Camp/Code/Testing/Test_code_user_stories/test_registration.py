# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : registration.py
# PURPOSE        : testing logic for Registration
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 15-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	01-OCT-2016  	ROHAN SAWANT    		Started coding
# ================================================================================

import sys
sys.path.append("Python")
import common_functions
sys.path.append("Python/User_Stories")
import registration
sys.path.append("Testing/Test_data_user_stories")
import csv
import json

class Test_registration(object):

	def getFromCsv(self,filename,where):
		""" Read to csv file """
		
		cf = common_functions.Common_functions()
		# Reading csv and storing data in List of List
		list_data = cf.csvToListOfList('Testing/Test_data_user_stories/'+filename) 
		# Converting List of List to List of Dictionary
		list_dict_data = cf.convertListToDict(list_data)
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

	def test_register(self):
	
		reg = registration.Registration()
				
		data = self.getFromCsv('test_data_registration.csv',{})
				
		for i in range(0,len(data)):
			return_front_end_dict = '{ "data": ' + json.dumps([data[i]]) + '}'
		
			reg.register(return_front_end_dict)
		
a = Test_registration()
a.test_register()


