# ===============================================================================
#                             GILA BREATH CAMP
#
# ===============================================================================
# ===============================================================================
# FILE NAME      : main_testing.py
# PURPOSE        : testing logic for all
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
sys.path.append("Testing/Test_data_user_stories")
sys.path.append("Testing/Test_code_user_stories")
import test_registration
import filecmp

def main_test_register_test():
	tr = test_registration.Test_registration()
	expected_errors_data = tr.getFromCsv('expected_errors_data.csv',{})
	actual_errors_data = tr.getFromCsv('actual_errors_data.csv',{})
	expected_applicant_id = []
	for i in range(0,len(expected_errors_data)):
		expected_applicant_id.append(expected_errors_data[i]['applicant_id'])
	for j in range(0,len(actual_errors_data)):
		if actual_errors_data[j]['applicant_id'] in expected_applicant_id:
			print(expected_errors_data[j]['applicant_id'],":","success")

main_test_register_test()
