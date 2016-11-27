import sys
import json
import ast
sys.path.append("Python/User_Stories")
sys.path.append("Python")
sys.path.append("Csv")
import assignment_of_tribes
import common_functions

front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2017-02-12 00:00:00.000000","no_of_tribes":"8"}]})
front_end_str2 = json.dumps({"data" :[{"applicant_id":"1" , "acceptance_packet" : "0", "rejected_reason" : "Date pending"},{"applicant_id":"7" , "acceptance_packet" : "1", "rejected_reason" : "Date pending 2"}]})

aob = assignment_of_tribes.Assignment_of_tribes()
st = aob.readTribesData(front_end_str1)

cf = common_functions.Common_functions()
lol = cf.csvToListOfList('Csv/applicant.csv')
header = lol[0]
cf.printLod(st,header)

print(st)

