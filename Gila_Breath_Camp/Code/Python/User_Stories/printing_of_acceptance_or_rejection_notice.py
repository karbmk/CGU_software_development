# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : printing_of_acceptance_or_rejection_notice.py
# PURPOSE        : printing of notice
# AUTHOR         : Jemin Gohil
# CREATION DATE  : 1-Nov-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	1-Nov-2016  	Jemin Gohil    		    Started coding
# 
# ================================================================================

import sys
import ast
import json
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant
sys.path.append("Python/User_Stories")
import application_status

front_end_str = json.dumps({"data" :[{"applicant_id":"1"}]}) #Need to remove
class Notice(object):
	"""docstring for AcceptanceNotice"""
	def __init__(self):
		pass
		
	def getDataFromAppStatus(self,front_end_str):
		return [{"applicant_id":"1","applicant_first_name":"ROHAN","applicant_last_name":"SAWANT","application_status":"0","violations":["Age Not in Range","Due date passed"]}]

	def acceptance(self,front_end_str):
		
		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		print('front_end_data :',front_end_data)

		cf = common_functions.Common_functions() 
		data = cf.getFromCsv('applicant.csv',front_end_data)
		

		data1 = self.getDataFromAppStatus(front_end_str)

		data[0]["violations"] = data1[0]["violations"]
		data[0]["application_status"] = data1[0]["application_status"]

		
		with open("Dustbin/Jemin/a_template.txt", "r") as myfile:
			template = myfile.readlines()
			print(template)

ap = Notice()
ap.acceptance(front_end_str)
