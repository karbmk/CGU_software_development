getTest = function(id)
{ 
	alert(document.getElementById("c_first_name").value);
	//k = document.getElementById("user_id").value;
    //var conf_password = document.getElementById("confirm").value;
    //alert(conf_password);
	
    var k =
        {
            c_first_name:document.getElementById("c_first_name").value,
            c_last_name:document.getElementById("c_last_name").value,
            c_age:document.getElementById("c_age").value,
            //c_sex:document.getElementById("c_sex").value,
            c_address:document.getElementById("c_address").value,
            g_first_name:document.getElementById("g_first_name").value,
            g_last_name:document.getElementById("g_last_name").value,
            g_address:document.getElementById("g_address").value,
            g_contact_info:document.getElementById("g_contact_info").value,
            g_emergency_contact:document.getElementById("g_emergency_contact").value,
            g_payment:document.getElementById("g_payment").value
        };
    var input = JSON.stringify({k:k})
	alert(input)
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
        		alert("thank you behenchod tune regester karli hain")
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("chutiye password galat kiya hoga dekh le");
      		}
    	}
  	);
	
	
	
}
