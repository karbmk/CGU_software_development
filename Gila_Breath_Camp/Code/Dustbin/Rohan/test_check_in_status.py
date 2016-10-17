import sys
import json
import ast
sys.path.append("Python/User_Stories")
import check_in_status

front_end_str1 = json.dumps({"data" :[{"applicant_id": "3", "boot": "1", "check_in_status": "1", "applicant_first_name": "JEMIN", "bugs_spray": "1", "camp_time_slots": "2016-10-15 00:00:00.000000", "legal_form": "1", "water_bottle": "1", "sleeping_bag": "1", "sunscreen": "1", "applicant_last_name": "GOHIL", "medical_form": "1", "helmet": "1"}]})

cis = check_in_status.Check_in_status()
#st = cis.getCheckInStatus(front_end_str1)

#print(st)

st = cis.updateCheckInStatus(front_end_str1)


