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
# PENDING 		 : Logic for update
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	01-OCT-2016  	KARTHIK MANJUNATH		Just defined name of functions
# 2.0		02-OCT-2016		ROHAN SAWANT			Made reading logic for getFromCsv
# 3.0		02-OCT-2016		KARTHIK MANJUNATH		Adding Logic to convert dict to Object
# 4.0       10-OCT-2016		ROHAN SAWANT			Adding increment logic for Id's
# 5.0       10-OCT-2016		ROHAN SAWANT			Corrected increment logic for Id's empty file
# 6.0       10-OCT-2016		ROHAN SAWANT			Created update data to csv function (many rows)
# 7.0       10-OCT-2016		ROHAN SAWANT			Created update data to csv function (one row)
# 8.0		15-OCT-2016		ROHAN SAWANT			Added suffix function for Integers
# ===============================================================================

import csv
import sys
sys.path.append("Csv")

class Common_functions(object):

	def csvToListOfList(self,filename):
		""" Read from csv file to List of List """

		data = []
		with open(filename, "rt", encoding='ascii') as csvfile:
			csvreader = csv.reader(csvfile, delimiter=',', skipinitialspace=True)
			data = list(csvreader)
		
		return data
	
	def convertListToDict(self,input_list):
		""" Convert List of List to Dictionary (having header) """
		
		list_of_dict = []
		header = input_list[0]
		
		for i in range(1,len(input_list)):
			dict = {}
			for j in range(0,len(header)):
				dict[header[j]] = input_list[i][j]
			list_of_dict.append(dict)
				
		return list_of_dict

	def suffix(self,d):
		return 'th' if 11<=d<=13 else {1:'st',2:'nd',3:'rd'}.get(d%10, 'th')

	def insertIntoCsv(self,filename,object_name):
		""" Insert into .csv from objects """
		
		dict = object_name.__dict__
		list_data = self.csvToListOfList('Csv/'+ filename)

		last_row = [list_data[0]]

		if len(list_data) != 1:
			last_row.append(list_data[len(list_data)-1])

		last_row_dict = self.convertListToDict(last_row)

		output_list = []
		relations = self.csvToListOfList('relations.csv')
		relations_dict = self.convertListToDict(relations)
		
		for i in range(0,len(list_data[0])):
			for j in range(0,len(relations_dict)):
				if relations_dict[j]['filename'] == filename:
					if len(list_data) != 1:
						dict[relations_dict[j]['column']] = int(last_row_dict[0][relations_dict[j]['column']]) + 1
					else:
						dict[relations_dict[j]['column']] = 1
			output_list.append(str(dict[list_data[0][i]]))
		
		writer=csv.writer(open('Csv/'+ filename,'a'),quoting=csv.QUOTE_ALL,lineterminator='\n')
		writer.writerow(output_list)

	def updateManyRowIntoCsv(self,filename,list_of_dict,input_key):
		""" Update into .csv from objects """

		csv_list_of_data = self.csvToListOfList('Csv/'+ filename)

		# get values from where i.e. input_key_id

		column_number = 0

		for i in range(0,len(csv_list_of_data[0])):
			if csv_list_of_data[0][i] == input_key:
				column_number = i

		for i in range(0,len(csv_list_of_data)):
			# finding the id
			for j in range(0,len(list_of_dict)):
				if csv_list_of_data[i][column_number] == list_of_dict[j][input_key]:
					# replacing values
					for k in range(0,len(csv_list_of_data[i])):						
						csv_list_of_data[i][k] = list_of_dict[j][csv_list_of_data[0][k]]

		# write into file
		with open('Csv/'+ filename, 'w', newline='') as csvfile:
			writer = csv.writer(csvfile,quoting=csv.QUOTE_ALL)
			writer.writerows(csv_list_of_data)

	def updateOneRowIntoCsv(self,filename,object_name,input_key):
		""" Update into .csv from objects """

		csv_list_of_data = self.csvToListOfList('Csv/'+ filename)
		object_name_dict = object_name.__dict__

		# get values from where i.e. input_key_id
		input_id = object_name_dict[input_key]

		column_number = 0

		for i in range(0,len(csv_list_of_data[0])-1):
			if csv_list_of_data[0][i] == input_key:
				column_number = i

		for i in range(0,len(csv_list_of_data)-1):
			# finding the id
			if csv_list_of_data[i][column_number] == input_id:
				# replacing values
				for j in range(0,len(csv_list_of_data[i])-1):
					csv_list_of_data[i][j] = object_name_dict[csv_list_of_data[0][j]]

		# write into file
		with open('Csv/'+ filename, 'w', newline='') as csvfile:
			writer = csv.writer(csvfile,quoting=csv.QUOTE_ALL)
			writer.writerows(csv_list_of_data)

	def getFromCsv(self,filename,where):
		""" Read to csv file """
		
		# Reading csv and storing data in List of List
		list_data = self.csvToListOfList('Csv/'+filename) 
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

