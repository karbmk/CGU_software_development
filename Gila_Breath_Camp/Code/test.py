def setSequence(csv_data,input_list):
	""" Returns a list in a sequence putting data in csv as first """
	output_list = [csv_data]
	
	for i in range(0,len(input_list)):
		if input_list[i] != csv_data:
			output_list.append(input_list[i])

	return output_list

	