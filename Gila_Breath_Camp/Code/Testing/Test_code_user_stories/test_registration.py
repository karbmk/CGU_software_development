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
# 1.0   	15-OCT-2016  	ROHAN SAWANT    		Started coding
# ================================================================================

import sys
sys.path.append("Python")
import common_functions
sys.path.append("Python/User_Stories")
import registration
sys.path.append("Testing/Test_data_user_stories")
import csv
import json
import ast

class Test_registration(object):

	def getFromCsv(self,filename,where):
		""" Read to csv file """

		cf = common_functions.Common_functions()
		# Reading csv and storing data in List of List
		list_data = cf.csvToListOfList('Testing/Test_data_user_stories/Registration/'+filename) 
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
		
	def insertIntoCsv(self,filename,object_name):
		""" Insert into .csv from objects """
		
		cf = common_functions.Common_functions()
		dict = object_name
		list_data = cf.csvToListOfList('Testing/Test_data_user_stories/Registration/'+ filename)

		last_row = [list_data[0]]

		if len(list_data) != 1:
			last_row.append(list_data[len(list_data)-1])

		last_row_dict = cf.convertListToDict(last_row)

		output_list = []
		relations = cf.csvToListOfList('relations.csv')
		relations_dict = cf.convertListToDict(relations)
		
		for i in range(0,len(list_data[0])):
			for j in range(0,len(relations_dict)):
				if relations_dict[j]['filename'] == filename:
					if len(list_data) != 1:
						dict[relations_dict[j]['column']] = int(last_row_dict[0][relations_dict[j]['column']]) + 1
					else:
						dict[relations_dict[j]['column']] = 1
			output_list.append(str(dict[list_data[0][i]]))
		
		writer=csv.writer(open('Testing/Test_data_user_stories/Registration/'+ filename,'a'),quoting=csv.QUOTE_ALL,lineterminator='\n')
		writer.writerow(output_list)

	def test_register(self):
	
		reg = registration.Registration()
				
		data = self.getFromCsv('sample_registration_data.csv',{})
		
		success	= []
		error = []
		
		for i in range(0,len(data)):

			return_front_end_dict = '{ "data": ' + json.dumps([data[i]]) + '}'
			return_data = reg.register(return_front_end_dict)
			front_end_dict = ast.literal_eval(return_data)
		
			if front_end_dict['status'] == 'success':
				success.append(front_end_dict['data'][0])
			if front_end_dict['status'] == 'error':
				error.append(front_end_dict['data'][0])	
				data[i]['error_message'] = front_end_dict['message']
				self.insertIntoCsv('actual_errors_data.csv',data[i])
		
a = Test_registration()
a.test_register()


