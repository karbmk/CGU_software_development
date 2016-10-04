getTest = function(id)
{ 
	alert(document.getElementById("user_id").value);
	k = document.getElementById("user_id").value;
	$.ajax
	(
		{
			type:"POST",
			url:"../create_volume/",
			data: 
   				{
        			vol_name: k // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
        		debugger;
        		alert("success")
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("fail");          
      		}
    	}
  	);
}
