import sys
import json
import ast
sys.path.append("Python/User_Stories")
import check_in_status

front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2016-12-11 00:00:00.000000"}]})
front_end_str2 = json.dumps({"data" :[{"applicant_id": "3"}]})

cis = check_in_status.Check_in_status()
st = cis.getCheckInStatus(front_end_str2)

#print(st)

#st = cis.updateCheckInStatus(front_end_str2)

print(st)
