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
"application_status":"",
"guardian_ssn":"DHND128839"
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

front_end_str3 = json.dumps({"data" :[{
"applicant_id":"",
"user_id":"1",
"bunkhouse_id":"",
"tribe_id":"",
"camp_time_slots":"2016-10-15 00:00:00.000000",
"applicant_first_name":"Karthik",
"applicant_last_name":"Basavanahalli",
"applicant_age":"23",
"applicant_gender":"Male",
"applicant_address":"1455 N College Ave, Claremont, CA 91711",
"guardian_first_name":"Manjunath",
"guardian_last_name":"Basavanahalli",
"guardian_contact_number":"5038471008",
"guardian_address":"Maruti Nilaya, Vasabashwara State",
"application_date":"",
"emergency_contact":"9969381108",
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


front_end_str4 = json.dumps({"data" :[{
"applicant_id":"",
"user_id":"1",
"bunkhouse_id":"",
"tribe_id":"",
"camp_time_slots":"2016-10-15 00:00:00.000000",
"applicant_first_name":"Jemin",
"applicant_last_name":"Gohil",
"applicant_age":"21",
"applicant_gender":"Male",
"applicant_address":"4655, Wesley Way, Claremont, CA-91711",
"guardian_first_name":"Sanjiv",
"guardian_last_name":"Gohil",
"guardian_contact_number":"9092283636",
"guardian_address":"Flat No. 100,Triveni Apartments,Pitam Pura,NEW DELHI 110034,INDIA",
"application_date":"",
"emergency_contact":"9969389198",
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



front_end_str5 = json.dumps({"data" :[{
"applicant_id":"",
"user_id":"1",
"bunkhouse_id":"",
"tribe_id":"",
"camp_time_slots":"2016-10-16 00:00:00.000000",
"applicant_first_name":"Sohiel",
"applicant_last_name":"Bouzari",
"applicant_age":"35",
"applicant_gender":"Male",
"applicant_address":"Department of State, 2050 Bamako Place, Washington, DC 20521-2050",
"guardian_first_name":"Rick",
"guardian_last_name":"Bouzari",
"guardian_contact_number":"9092283621",
"guardian_address":"Department of State,7100 Athens Place, Washington, DC 20521-7100",
"application_date":"",
"emergency_contact":"9019389198",
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
"application_status":"",
"guardian_ssn":"DHND128839"
}]})

front_end_str10 = json.dumps({"data" :[{"guardian_ssn":"342-909-8981"}]})

regis = registration.Registration()
#st = regis.register(front_end_str1)
#st = regis.register(front_end_str3)
#st = regis.register(front_end_str4)
#st = regis.register(front_end_str2)
st = regis.alreadySsn(front_end_str10)
print(st)

