getTest = function(id)
{ 

    var k =
        {
			applicant_id:"",
			user_id:"1",
			bunkhouse_id:"",
			tribe_id:"",
			camp_time_slots:'2016-10-15 00:00:00.000000',
            applicant_first_name:document.getElementById("c_first_name").value,
            applicant_last_name:document.getElementById("c_last_name").value,
            applicant_age:document.getElementById("c_age").value,
            applicant_gender:document.getElementById("c_sex").value,
            applicant_address:document.getElementById("c_address").value,
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
	alert(typeof(input))
	$.ajax
	(
		{
			type:"POST",
			url:"../../create_volume/",
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
        		debugger;
        		alert("chutiye password galat kiya hoga dekh le");
      		}
    	}
  	);
	
}
String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.split(search).join(replacement);
};
