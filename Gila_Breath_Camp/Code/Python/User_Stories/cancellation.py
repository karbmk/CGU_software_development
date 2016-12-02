# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : cancellation.py
# PURPOSE        : Logic for cancellation
# AUTHOR         : SOHEIL BOUZARI
# CREATION DATE  : 28-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# ----------------------------------------------------------------------------------
# 1.0   	28-OCT-2016  	SOHEIL BOUZARI    		Started coding
# ===================================================================================



import sys
import ast
import json
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant
sys.path.append("Python/User_Stories")

class Cancellation(object):

	def cancel(self,) 

		input_from_ui = json.loads('{"applicant_id": "9", "cancel_flag":"1"}')

		applicantid = input_from_ui['applicant_id']
		cancelflag = input_from_ui['cancel_flag']


		cf = common_functions.Common_functions()
		where = {'applicant_id':str(applicantid)}
		data = cf.getFromCsv("applicant.csv",where)
		data[0]['cancel_flag'] = str(cancelflag)

		#print (data[0]) 


		#updateManyRowIntoCsv(self,filename,list_of_dict,input_key):

		cf.updateManyRowIntoCsv("applicant.csv",data,"applicant_id")



