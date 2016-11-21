# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : application_cancellation.py
# PURPOSE        : Logic to cancel an application of an applicant
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 23-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	23-OCT-2016  	SOHEIL BOUZARI    		Started coding
# ================================================================================

import sys
import ast
import json
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant
import applicant_status
sys.path.append("Python/User_Stories")

class Application_cancellation(object):

	def getApplicationCancellation(self,front_end_str):

		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data']

		cf = common_functions.Common_functions()
		data = cf.getFromCsv("applicant.csv",front_end_data)

		apps = application_status.Application_status()
		new_data = apps.getApplicationStatus(front_end_str)

		data = cf.getFromCsv("applicant.csv",where)
		data[0]['cancel_flag'] = str(cancelflag)

		cf.updateManyRowIntoCsv("applicant.csv",data,"applicant_id")
		
