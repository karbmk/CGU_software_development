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
# 2.0       3-Nov-2016      Jemin Gohil         	Logic for printing rejection notice
# 3.0      	16-Nov-2016 	Jemin Gohil            	Printing rejection notice completed
# ================================================================================

import sys
import ast
import json
import os
import getpass
sys.path.append("Python")
import common_functions
sys.path.append("Python/Entities")
import applicant
sys.path.append("Python/User_Stories")
import application_status

#front_end_str = json.dumps({"data" :[{"applicant_id":"1"}]}) #Need to remove

class Notice(object):
	"""docstring for AcceptanceNotice"""
	def __init__(self):
		pass
		
	def acceptance(self,front_end_str):
		
		front_end_dict = ast.literal_eval(front_end_str)
		front_end_data = front_end_dict['data'][0]
		#print('front_end_data :',front_end_data)

		cf = common_functions.Common_functions() 
		data = cf.getFromCsv('applicant.csv',front_end_data)
		#print(data)

		app = application_status.Application_status()
		data1 = app.getApplicationStatus(front_end_str)
		data2 = ast.literal_eval(data1)
		data3 = data2['data']
		#print("data2 :",data2)

		#print(data)
		#print("data3[0]['violations'] :",data3[0]["violations"])

		data[0]["violations"] = data3[0]["violations"]
		data[0]["application_status"] = data3[0]["application_status"]
	
		if data[0]["violations"][0] =="NO VIOLATIONS":
			file_print = "Textfiles/Templates/a_template.txt"
			path_name = "acception_letter"
		else:
			file_print = "Textfiles/Templates/r_template.txt"
			path_name = "rejection_letter"

		with open(file_print, "r") as myfile:
			template = myfile.readlines()
			temp = ''.join(template)

		k = 1
		Str = ''
		for j in range(0,len(data)):
			t = temp
			for i in data[j].keys():
				if('*'+i+'*' in temp ):
					try:
						t = t.replace('*'+i+'*',data[j][i])
					except:
						pass
			#print("--------------------------------")
			Str = ''
			for m in range(0,len(data[j]['violations'])):
				if m == 0:
					Str = str(m+1) + '. ' + data[j]['violations'][m]
				else:
					Str = Str + '\n' + str(m+1) + '. ' +  data[j]['violations'][m]
			#print(type(Str))
			t=t.replace("*violations*",Str)
			#print ("yes")


			#print(t)
		user  = getpass.getuser()
		save_path = 'C:/Users/' + user + '/Documents/Gila_Breath_Camp'
		
		if not os.path.exists(save_path):
			os.makedirs(save_path)
		
		name_of_file = data[0]["applicant_first_name"]+"_"+data[0]["applicant_last_name"]+"_"+data[0]["applicant_id"]+"_"+path_name
		completeName = os.path.join(save_path, name_of_file + ".txt")
		text_file = open(completeName,"w")
		text_file.write(t)
		text_file.close()
		print(t)

#ap = Notice()
#ap.acceptance(front_end_str)


