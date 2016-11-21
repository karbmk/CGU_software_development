import sys
import json
import ast
sys.path.append("Python/User_Stories")
import priorities

front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2017-02-12 00:00:00.000000"}]})

pr = priorities.Priorities()
st = pr.getCustomerPriorities(front_end_str1)

print(st)

