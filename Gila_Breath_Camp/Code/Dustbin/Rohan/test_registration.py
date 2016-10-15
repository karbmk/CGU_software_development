import sys
import json
import ast
sys.path.append("Python/User_Stories")
import registration

front_end_str1 = json.dumps({"data" :[{
"applicant_id":"",
"user_id":"1",
"bunkhouse_id":"",
"tribe_id":"",
"camp_time_slots":"2016-10-15 00:00:00.000000",
"applicant_first_name":"Rohan",
"applicant_last_name":"Sawant",
"applicant_age":"26",
"applicant_gender":"Male",
"applicant_address":"1455 N College Ave, Claremont, CA 91711",
"guardian_first_name":"Umakant",
"guardian_last_name":"Sawant",
"guardian_contact_number":"9096758877",
"guardian_address":"1455 N College Ave, Claremont, CA 91711",
"application_date":"",
"emergency_contact":"9096668877",
"payment":"1000",
"medical_form":"",
"legal_form":"",
"helmet":"",
"boot":"",
"sleeping_bag":"",
"water_bottle":"",
"sunscreen":"",
"bugs_spray":"",
"check_in_status":"",
"application_status":""
}]})

front_end_str2 = json.dumps({"data" :[{
"applicant_id":"",
"user_id":"1",
"bunkhouse_id":"",
"tribe_id":"",
"camp_time_slots":"2016-10-15 00:00:00.000000",
"applicant_first_name":"212",
"applicant_last_name":"12",
"applicant_age":"ABC",
"applicant_gender":"Male",
"applicant_address":"1455 N College Ave, Claremont, CA 91711",
"guardian_first_name":"21",
"guardian_last_name":"212",
"guardian_contact_number":"212",
"guardian_address":"1455 N College Ave, Claremont, CA 91711",
"application_date":"",
"emergency_contact":"212",
"payment":"212",
"medical_form":"",
"legal_form":"",
"helmet":"",
"boot":"",
"sleeping_bag":"",
"water_bottle":"",
"sunscreen":"",
"bugs_spray":"",
"check_in_status":"",
"application_status":""
}]})

regis = registration.Registration()
st = regis.register(front_end_str2)
print(st)
