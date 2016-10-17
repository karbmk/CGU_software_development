send_appl_status = function(id)
{ 
	//alert(document.getElementById("").value);
	//alert("in js")
	var input = '{"data" :[{"date_id":"1"}]}';
	//alert(typeof(input))
	//location.reload()
	//$("#register").className='';
	//$("#check").className = 'active'
	//location.reload()
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
        		debugger;
        		alert("chutiye password galat kiya hoga dekh le");
      		}
    	}
  	);
	
	//alert(test)
	
	
	
}
