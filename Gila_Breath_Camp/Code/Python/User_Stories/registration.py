# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : registration.py
# PURPOSE        : Logic for Registration
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
sys.path.append("Python/Entities")
import applicant
import user

class Registration(object):

	def __init__(self,front_end_str):
		appl = applicant.Applicant()
		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data']
		print(front_end_dict)




