# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : common_functions.py
# PURPOSE        : READ from or WRITE to any CSV file, Joins, Convert Object to
#				   class and many more. All the common functions
# AUTHOR         : KARTHIK MANJUNATH
# CREATION DATE  : 01-OCT-2016
# PENDING 		 : Logic for insert,update, object and list of object identification
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	01-OCT-2016  	KARTHIK MANJUNATH		Just defined name of functions
# 2.0		02-OCT-2016		ROHAN SAWANT			Made reading logic for getFromCsv
# ===============================================================================

import csv

class Common_Csv(object):

	def csvToListOfList(filename):
		""" Read from csv file to List of List """

		data = []
		with open(filename, "rt", encoding='ascii') as csvfile:
			csvreader = csv.reader(csvfile, delimiter=',', skipinitialspace=True)
			data = list(csvreader)
		
		return data
	
	def convertListToDict(input_list):
		""" Convert List of List to Dictionary (having header) """
		
		list_of_dict = []
		header = input_list[0]
		
		for i in range(1,len(input_list)):
			dict = {}
			for j in range(0,len(header)):
				dict[header[j]] = input_list[i][j]
			list_of_dict.append(dict)
				
		return list_of_dict

	def insertIntoCsv(self,filename):
		pass
	
	def updateIntoCsv(self,filename):
		pass
	
	def getFromCsv(self,filename,where,return_type):
		""" Read to csv file
			return_type can be a 
				'L' which is list of objects
				'O' which is object
		"""
		
		# Reading csv and storing data in List of List
		list_data = csvToListOfList(filename) 
		# Converting List of List to List of Dictionary
		list_dict_data = convertListToDict(list_data)
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

		# Code here the logic to convert List of Dictionary to One Object or List of Objects depending on the type
			
		return list_dict_data_where

