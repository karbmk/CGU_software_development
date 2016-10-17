getTest2 = function(id)
{ 
	var input = '{"data" :[{"date_id":"1"}]}';
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
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="firstname'+i+'">'+obj_array[i]["applicant_first_name"]+'</td>'
				html += '<td id="lastname'+i+'">'+obj_array[i]["applicant_last_name"]+'</td>'
				html += '<td id="completed'+i+'">'+check_stat+'</td>'
				html += '<td align="center"><input id="appl_status'+i+'" type="checkbox" name="appl_status" '+check+'></td>'
				html += '<td id="comments'+i+'">'+obj_array[i]["rejected_reason"]+'</td>'
				
				html += '</tr>'
				$("#app_status").append(html);
				}
        		
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);	
	
}
