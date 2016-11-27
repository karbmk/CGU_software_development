import sys
import json
import ast
sys.path.append("Python/User_Stories")
import assignment_of_bunkhouses

front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2017-02-12 00:00:00.000000","no_of_bunkhouses":"4"}]})
front_end_str2 = json.dumps({"data" :[{"applicant_id":"1" , "acceptance_packet" : "0", "rejected_reason" : "Date pending"},{"applicant_id":"7" , "acceptance_packet" : "1", "rejected_reason" : "Date pending 2"}]})

aob = assignment_of_bunkhouses.Assignment_of_bunkhouses()
st = aob.readBunkhouseData(front_end_str1)

print(st)

