getTest = function(id)
{ 
//alert(typeof(id))
var camp_slots = "";
$.ajax
	(
		{
			type:"GET",
			url:"../../application_status_get/",
			async:false,
			success:function(response){
			var obj = $.parseJSON(response)
			if(id==1)
			{
				camp_slots = obj["data"][0]["camp_time_slots1"]
			}
			else if(id==2)
			{
				camp_slots = obj["data"][0]["camp_time_slots2"]
			}
			else if(id==3)
			{
				camp_slots = obj["data"][0]["camp_time_slots3"]
			}
			},
			error:function(response){
				alert("error")
			}
		}
	);

    var k =
        {
			applicant_id:"",
			user_id:"1",
			bunkhouse_id:"",
			tribe_id:"",
			camp_time_slots:camp_slots,
            applicant_first_name:document.getElementById("c_first_name").value,
            applicant_last_name:document.getElementById("c_last_name").value,
            applicant_age:document.getElementById("c_age").value,
            applicant_gender:document.getElementById("c_sex").value,
            applicant_address:document.getElementById("c_address").value,
			guardian_ssn:document.getElementById("g_ssn").value,
            guardian_first_name:document.getElementById("g_first_name").value,
            guardian_last_name:document.getElementById("g_last_name").value,
            guardian_address:document.getElementById("g_address").value,
            guardian_contact_number:document.getElementById("g_contact_info").value,
			application_date:"",
            emergency_contact:document.getElementById("g_emergency_contact").value,
            payment:document.getElementById("g_payment").value,
			medical_form:"",
			legal_form:"",
			helmet:"",
			boot:"",
			sleeping_bag:"",
			water_bottle:"",
			sunscreen:"",
			bugs_spray:"",
			check_in_status:"",
			application_status:""
        };
    var input = JSON.stringify({data:[k]})
	$.ajax
	(
		{
			type:"POST",
			url:"../../registration_ui/",
			async:true,
			data: 
   				{
        			vol_name: input // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
        		debugger;
				var obj = $.parseJSON(data)
				if(obj["status"] == "success")
				{
					alert(obj["message"])
					location.reload()
				}
				else{
					
					alert(obj["message"].replaceAll("|","\n"))
				}
				
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	
}
String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.split(search).join(replacement);
};
alreadySsn = function(id){
	Ssn = '{"data" :[{"guardian_ssn":"'+document.getElementById("g_ssn").value+'"}]}'
	$.ajax
	(
		{
			type:"POST",
			url:"../../already_ssn/",
			async:true,
			data: 
   				{
        			ssn: Ssn 
        		},
    		dataType: "text",
    		success: function(data) 
    		{
        		debugger;
				var obj = $.parseJSON(data)
				if(obj["status"] == "success")
				{
					if (confirm(obj["message"].replaceAll("|","\n"))) {
						// Save it!
						document.getElementById("g_ssn").value = obj["data"][0]["guardian_ssn"];
						document.getElementById("g_first_name").value = obj["data"][0]["guardian_first_name"];
						document.getElementById("g_last_name").value = obj["data"][0]["guardian_last_name"];
						document.getElementById("g_address").value = obj["data"][0]["guardian_address"];
						document.getElementById("g_contact_info").value = obj["data"][0]["guardian_contact_number"];
						document.getElementById("g_emergency_contact").value = obj["data"][0]["emergency_contact"]
					} else {
						// Do nothing!
					}
				}
				else{
					//do nothing
				}
				
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	
}