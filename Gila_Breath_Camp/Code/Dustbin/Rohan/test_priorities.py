import sys
import json
import ast
sys.path.append("Python/User_Stories")
import priorities

#front_end_str1 = json.dumps({"data" :[{"camp_time_slots":"2017-02-12 00:00:00.000000"}]})
#front_end_str2 = json.dumps({"data" :[{"applicant_name_not_together_with":"GOHIL, JEMIN"}]})
front_end_str3 = json.dumps({"data" :
	[{"applicant_id":"1","name" : "GOHIL, JEMIN", "applicant_name_together_with":"KOHLI, VIRAT","applicant_ssn_together_with":"000-11-1111","applicant_name_not_together_with":"NONE","applicant_ssn_not_together_with":"NONE"},
	{"applicant_id":"2","name" : "BASAVANAHALLI, KATHIK", "applicant_name_together_with":"NONE","applicant_ssn_together_with":"NONE","applicant_name_not_together_with":"GOHIL, JEMIN","applicant_ssn_not_together_with":"342-909-8981"}
	]})

pr = priorities.Priorities()
#st = pr.getCustomerPriorities(front_end_str1)

#st = pr.getSsn(front_end_str2)

st = pr.updateCustomerPriorities(front_end_str3)
print(st)

