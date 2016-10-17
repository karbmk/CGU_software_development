import sys
import json
import ast
sys.path.append("Python/User_Stories")
import choose_date


#front_end_str1 = json.dumps({"data" :[{"date_id":"1"}]})
#front_end_str1 = json.dumps({"data" :[{"date_id":"2"}]})

#front_end_str1 = json.dumps({"data" :[{"date_id":"1"}]})

dt = choose_date.Choose_date()
st = dt.chooseDate()

print(st)

