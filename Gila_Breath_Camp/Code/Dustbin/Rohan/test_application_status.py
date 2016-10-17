import sys
import json
import ast
sys.path.append("Python/User_Stories")
import application_status

front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2016-10-15 00:00:00.000000"}]})

apps = application_status.Application_status()
st = apps.getApplicationStatus(front_end_str1)

print(st)


