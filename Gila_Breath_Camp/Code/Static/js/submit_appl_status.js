send_appl_status = function(id)
{ 
	var input = '{"data" :[{"date_id":"1"}]}';
	var test = 0;
	document.getElementById("check_click").onclick=''
	$.ajax
	(
		{
			type:"POST",
			url:"../../test_js/",
			async:false,
			data: 
   				{
        			vol_name: input // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				
				test = obj_array.length
				//alert(data)
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	
	var array = []
	var stat = '1'
	for(i=0;i<test;i++)
	{
		if(document.getElementById("appl_status"+i).checked)
		{
			stat = '1'
		}
		else
		{
			stat = '0'
		}
		var k = '{"applicant_id":"'+document.getElementById("appl"+i).innerText+'", "acceptance_packet":"'+stat+'"}'
		array.push(k)
	}
	alert(array)
	input1 = '{"data":['+array+']}'
	$.ajax
	(
		{
			type:"POST",
			url:"../../application_status_send/",
			async:false,
			data: 
   				{
        			vol_name: input1 // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				var obj = $.parseJSON(data)
				alert(obj["message"])
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	
	
	
}
