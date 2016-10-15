import sys
import json
import ast
sys.path.append("Python/User_Stories")
import registration

front_end_str = json.dumps({"data" : {"applicant_id" : "1", "user_id" : "11", "first_name" : "Rohan", "last_name" : "Sawant", "guardian_first_name" : "Umakant", "guardian_last_name" : "Sawant", "guardian_contact_number" : "9096058877", "application_date" : "2016-10-15 01:21:35.286944","age":"26","gender"}, "message":"Date : Enter a valid date|Date : Enter a integer"})
regis = registration.Registration(front_end_str)
print(regis)

