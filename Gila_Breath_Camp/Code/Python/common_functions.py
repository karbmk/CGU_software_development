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

	def obj_dic(self,d):
		""" Convert list of dictionaries to list of objects """
		top = type('new', (object,), d)
		seqs = tuple, list, set, frozenset
		for i, j in d.items():
			if isinstance(j, dict):
				setattr(top, i, obj_dic(j))
			elif isinstance(j, seqs):
				setattr(top, i, 
					type(j)(obj_dic(sj) if isinstance(sj, dict) else sj for sj in j))
			else:
				setattr(top, i, j)
		return top

	def insertIntoCsv(self,filename,object_name):
		""" Insert into .csv from objects """
		
		dict = object_name.__dict__
		list_data = self.csvToListOfList('Csv/'+ filename)

		last_row = [list_data[0]]
		last_row.append(list_data[len(list_data)-1])
		last_row_dict = self.convertListToDict(last_row)

		output_list = []
		relations = self.csvToListOfList('relations.csv')
		relations_dict = self.convertListToDict(relations)
		
		for i in range(0,len(list_data[0])):
			for j in range(0,len(relations_dict)):
				if relations_dict[j]['filename'] == filename:
					dict[relations_dict[j]['column']] = int(last_row_dict[0][relations_dict[j]['column']]) + 1
			output_list.append(str(dict[list_data[0][i]]))
		
		writer=csv.writer(open('Csv/'+ filename,'a'),quoting=csv.QUOTE_ALL,lineterminator='\n')
		writer.writerow(output_list)

	def updateIntoCsv(self,filename):
		pass
	
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
		list_of_objects = []
		for dict_in_list in list_dict_data_where:
			list_of_objects.append(self.obj_dic(dict_in_list))
		return list_of_objects

