# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : priorities.py
# PURPOSE        : Take data of applicant priorities from guardian
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 17-NOV-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	17-NOV-2016  	ROHAN SAWANT    		Started coding
# 2.0		20-NOV-2016		ROHAN SAWANT			Completed function getCustomerPriorities
# 3.0		26-NOV-2016		ROHAN SAWANT			Completed update priorities
# ================================================================================

import sys
import json
import ast
import datetime
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant

class Priorities(object):

	def getCustomerPriorities(self,front_end_str):
		""" get data for priorities from Customer """

		cf = common_functions.Common_functions()
		appl = applicant.Applicant()

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]

		data = cf.getFromCsv('applicant.csv',front_end_data)

		if data == []:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered"}'
		else:
			new_data = []
			list_of_names = ["NONE"]
			list_of_id = ["NONE"]

			for i in range(0,len(data)):
				name = data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name']
				if name not in list_of_names:
					list_of_names.append(data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name'])

			for j in range(0,len(data)):
				new_dict = {}
				new_dict['applicant_id'] = data[j]['applicant_id']
				new_dict['applicant_name'] = data[j]['applicant_last_name'] + ', ' + data[j]['applicant_first_name']

				if data[j]['applicant_name_together_with'] != '':
					new_dict['applicant_name_together_with'] = self.setSequence(list_of_names,data[j]['applicant_name_together_with'])
				else:
					new_dict['applicant_name_together_with'] = list_of_names

				if data[j]['applicant_id_together_with'] != '':
					new_dict['applicant_id_together_with'] = self.setSequence(list_of_id,data[j]['applicant_id_together_with'])
				else:
					new_dict['applicant_id_together_with'] = list_of_id

				if data[j]['applicant_name_not_together_with'] != '':
					new_dict['applicant_name_not_together_with'] = self.setSequence(list_of_names,data[j]['applicant_name_not_together_with'])
				else:
					new_dict['applicant_name_not_together_with'] = list_of_names

				if data[j]['applicant_id_not_together_with'] != '':
					new_dict['applicant_id_not_together_with'] = self.setSequence(list_of_id,data[j]['applicant_id_not_together_with'])
				else:
					new_dict['applicant_id_not_together_with'] = list_of_id

				new_data.append(new_dict)

			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict

	def getId(self,front_end_str):
		""" Get Id for selected Name """

		front_end_dict = ast.literal_eval(front_end_str)

		together_flag = 1

		try:
			applicant_name = front_end_dict['data'][0]['applicant_name_together_with']

		except:
			applicant_name = front_end_dict['data'][0]['applicant_name_not_together_with']
			together_flag = 0

		cf = common_functions.Common_functions()
		data = cf.getFromCsv('applicant.csv',{})

		if data == []:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered"}'
		else:
			new_data = [{}]
			list_of_id = []

			for i in range(0,len(data)):
				name = data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name']
				if name == applicant_name:
					id = data[i]['applicant_id']
					if id not in list_of_id:
						list_of_id.append(data[i]['applicant_id'])

		if together_flag == 1:
			new_data[0]['applicant_id_together_with'] = list_of_id
		else:
			new_data[0]['applicant_id_not_together_with'] = list_of_id

		if len(list_of_id) <=1:
			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"" }'
		else:
			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"There are more than 1 Application Id\'s.| Please choose one of them from the dropdown" }'

		return return_front_end_dict

	def updateCustomerPriorities(self,front_end_str):
		""" Updating priorities in applicant.csv """

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data']

		cf = common_functions.Common_functions()		
		data = cf.getFromCsv('applicant.csv',{})

		if len(data) == 0:
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"error", "message":"Something went wrong" }'
		else:

			for i in range(0,len(data)):
				for j in range(0,len(front_end_data)):
					if data[i]['applicant_id'] == front_end_data[j]['applicant_id']:
						data[i]['applicant_name_together_with'] = front_end_data[j]['applicant_name_together_with']
						data[i]['applicant_id_together_with'] = front_end_data[j]['applicant_id_together_with']
						data[i]['applicant_name_not_together_with'] = front_end_data[j]['applicant_name_not_together_with']
						data[i]['applicant_id_not_together_with'] = front_end_data[j]['applicant_id_not_together_with']
			
			cf.updateManyRowIntoCsv('applicant.csv',data,'applicant_id')

			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All Applicant\'s data updated" }'

		return return_front_end_dict

	def setSequence(self,input_list,csv_data):
		""" Returns a list in a sequence putting data in csv as first """
		output_list = [csv_data]
		
		for i in range(0,len(input_list)):
			if input_list[i] != csv_data:
				output_list.append(input_list[i])

		return output_list


