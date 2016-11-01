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

class Notice(object):
	"""docstring for AcceptanceNotice"""
	def __init__(self):
		pass
		

	def acceptance(self,guardian_last_name,applicant_id,applicant_first_name,camp_time_slots):
		with open("../../Dustbin/Jemin/a_template.txt", "r") as myfile:
			template = myfile.readlines()
		

		template[0] = template[0].replace("*Guardian Last Name*",guardian_last_name)
		template[1] = template[1].replace("*Applicant First Name*",applicant_first_name)
		template[1] = template[1].replace("*Date*",camp_time_slots)
		
		print('\n'.join(template))
guardian_last_name = 'Abc'
applicant_id = '1'
applicant_first_name = 'Def'
camp_time_slots = 'December-2016'
a = Notice()
a.acceptance(guardian_last_name,applicant_id,applicant_first_name,camp_time_slots)
