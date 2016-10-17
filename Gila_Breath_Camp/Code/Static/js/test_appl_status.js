getTest2 = function(id)
{ 
	//alert(document.getElementById("").value);
	//alert("in js")
	var input = '{"data" :[{"date_id":"1"}]}';
	//alert(typeof(input))
	//location.reload()
	
	
	
	//$("#register").className='';
	//$("#check").className = 'active'
	//location.reload()
	document.getElementById("appl_click").onclick=''
	$.ajax
	(
		{
			type:"POST",
			url:"../../test_js/",
			async:true,
			data: 
   				{
        			vol_name: input // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				for(i=0;i<obj_array.length;i++)
				{
					if(obj_array[i]["acceptance_packet"]=='1')
					{
						check = 'checked'
					}
					else
					{
						check = ''
					}
					if(obj_array[i]["check_in_status"]=='1')
					{
						check_stat = 'ACCEPTED'
					}
					else
					{
						check_stat = 'REJECTED'
					}
					
				var html = '<tr>';
            	//alert(obj["data"][i]["jemin"])
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="firstname'+i+'">'+obj_array[i]["applicant_first_name"]+'</td>'
				html += '<td id="lastname'+i+'">'+obj_array[i]["applicant_last_name"]+'</td>'
				html += '<td id="completed'+i+'">'+check_stat+'</td>'
				html += '<td align="center"><input id="appl_status'+i+'" type="checkbox" name="appl_status" '+check+'></td>'
				html += '<td id="comments'+i+'">'+obj_array[i]["rejected_reason"]+'</td>'
				
				html += '</tr>'
				$("#app_status").append(html);
				}
				//alert(data)
        		
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("chutiye password galat kiya hoga dekh le");
      		}
    	}
  	);
	/*$.ajax({
        	type: 'GET',
        	url:"../../test_js",
			async:true,
        	success: function(response){
				var obj = $.parseJSON(response)
				var html = '<tr>';
            	alert(obj["data"][0]["jemin"])
				html += '<td>'+obj["data"][0]["jemin"]+'</td>'
				html += '<td>'+obj["data"][0]["jemin"]+'</td>'
				html += '<td>ra</td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '<td><input type="checkbox" name="medical" value="medical"></td>'
				html += '</tr>'
				$("#checkin").append(html);

				//var obj = JSON.parse(response);
				//alert(obj['data'][0]);
        	},
        	error: function(){
				alert("error")
        	}
    		});*/
	
	
	
	
}
