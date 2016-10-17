import sys
import json
import ast
sys.path.append("Python/User_Stories")
import application_status

#front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2016-10-15 00:00:00.000000"}]})
front_end_str2 = json.dumps({"data" :[{"applicant_id":"1" , "acceptance_packet" : "1"},{"applicant_id":"7" , "acceptance_packet" : "0"}]})

apps = application_status.Application_status()
#st = apps.getApplicationStatus(front_end_str1)


st = apps.updateApplicationStatus(front_end_str2)
print(st)


