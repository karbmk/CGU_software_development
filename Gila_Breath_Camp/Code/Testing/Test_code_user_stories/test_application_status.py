# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : test_application_status.py
# PURPOSE        : For testing application status
# AUTHOR         : ROHAN SAWANT
# CREATION DATE  : 16-OCT-2016
# PENDING 		 : 
# -------------------------------------------------------------------------------
# CHANGE HISTORY :
# VER	|	DATE       	|	MODIFIED BY  		|  	CHANGE DESCRIPTION
# -------------------------------------------------------------------------------
# 1.0   	16-OCT-2016  	ROHAN SAWANT    		Started coding
# ================================================================================

import sys
sys.path.append("Python")
import common_functions
sys.path.append("Python/User_Stories")
import application_status

class Test_application_status(object):

	def test_getApplicationStatus(self):
		""" testing function getApplicationStatus """
		
		appl_st = application_status.Application_status()
		out1 = appl_st.getApplicationStatus()
		
		cf = common_functions.Common_functions()
		
		list_dict = ast.literal_eval(st)
		
		for i range(0,len(list_dict)):
			dict = dict['data'][0]
	
	def test_updateApplicationStatus(self):
		appl_st = application_status.Application_status()
		appl_st.updateApplicationStatus()

		
	
	