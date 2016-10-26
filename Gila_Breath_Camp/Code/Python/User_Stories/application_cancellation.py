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
sys.path.append("Python/Entities")
import applicant

class Application_cancellation(object):

	# "{"data":[{"applicant_id":"1"},{"applicant_id":"2"},{"applicant_id":"10"}]}"
	def applicationCancellation(self,front_end_str):
		
