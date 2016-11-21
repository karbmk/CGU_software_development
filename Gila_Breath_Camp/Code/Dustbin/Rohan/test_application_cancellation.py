import sys
import json
import ast
sys.path.append("Python/User_Stories")
import application_cancellation

front_end_str1 = json.dumps({"data" :[{"applicant_id": "9", "cancel_flag":"1"}]})

apps = application_status.Application_status()
st = apps.getApplicationCancellation(front_end_str1)


#st = apps.updateApplicationStatus(front_end_str2)
print(st)


