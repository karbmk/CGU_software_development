import sys
import json
import ast
sys.path.append("Python/User_Stories")
import check_in_status

front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2016-10-17 00:00:00.000000"}]})

cis = check_in_status.Check_in_status()
st = cis.checkInStatus(front_end_str1)

print(type(st))
print(st)

