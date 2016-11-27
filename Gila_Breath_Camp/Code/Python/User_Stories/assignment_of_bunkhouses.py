# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# =====================================:=	=========================================
# FILE NAME      : assignment_of_bunkhousedata[i]s.py
# PURPOSE        : Assign bunkhouses to applicants
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 26-NOV-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	26-NOV-2016  	ROHAN SAWANT    		Started coding
# ================================================================================

class Assignment_of_bunkhouses(object):

	def readBunkhouseData(self,front_end_str):
		""" read data for Bunkhouse """

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		
		cf = common_functions.Common_functions()
		data = cf.getAcceptedApplicants(front_end_str)
		male_data = []
		female_data = []

		for i in range(0,len(data)):
			if data[i]['gender'] == 'MALE':
				male_data.append(data[i])
			elif data[i]['gender'] == 'FEMALE':
				female_data.append(data[i])

		male_data_with_bunhouses = self.assignBunkhouses(male_data)
		female_data_with_bunhouses = self.assignBunkhouses(female_data)

		if len(data) == 0:
			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }'
		else:
			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All applicant''s information retrieved" }'

		return return_front_end_dict

	def assignBunkhouses(self,list):
		""" Assigning Bunkhouses """

		for i in range(0,len(list)):




