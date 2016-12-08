import csv
import os
def csvToListOfList(filename):
		""" Read from csv file to List of List """

		data = []
		with open(filename, "rt", encoding='ascii') as csvfile:
			try:
				csvreader = csv.reader(csvfile, delimiter=',', skipinitialspace=True)
				data = list(csvreader)
			except Exceptionas as e:
				pass
		
		return data

def convertListToDict(input_list):
	""" Convert List of List to Dictionary (having header) """
	
	list_of_dict = []
	header = input_list[0]
	
	for i in range(1,len(input_list)):
		dict = {}
		for j in range(0,len(header)):
			dict[header[j]] = input_list[i][j]
		list_of_dict.append(dict)
			
	return list_of_dict
	
def getFromCsv(filename,where):
	""" Read to csv file """
	
	# Reading csv and storing data in List of List
	list_data = csvToListOfList(filename) 
	# Converting List of List to List of Dictionary
	list_dict_data = convertListToDict(list_data)
	list_dict_data_where = []
	
	if where == {}:
		# return all the data if there is no where clause defined
		list_dict_data_where = list_dict_data
	else:
		# find rows that match the where
		
		for i in range(0,len(list_dict_data)):
			dict = {}
			for columns in where:
				if list_dict_data[i][columns] == where[columns]:
					list_dict_data_where.append(list_dict_data[i])

	return list_dict_data_where

os.system("python lol.py")
print(getFromCsv("Report/output_new.csv",{}))
list_data = getFromCsv("Report/output_new.csv",{})
flag = ''
for i in range(0,len(list_data)):
	if(list_data[i]["Status"]=="Error"):
		flag='0'
		break
	elif(list_data[i]["Status"]=="Success"):
		flag='1'


if (flag == '1'):
	os.system("git push origin master")
	os.system("python ci_sd.py")
	print("Success")
else:
	print("Error")
	pass