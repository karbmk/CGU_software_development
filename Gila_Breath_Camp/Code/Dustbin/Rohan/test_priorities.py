import sys
import json
import ast
sys.path.append("Python/User_Stories")
import registration

front_end_str1 = json.dumps({"data" :[{
"applicant_id":"1",
"user_id":"1",
"":"",
"":""
}]})

pr = priorities.Priorities()
st = pr.customerPriorities(front_end_str)

print(st)

