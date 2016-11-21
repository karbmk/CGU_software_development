getTest2 = function(id)
{ //alert(id)
	var input = '{"data" :[{"date_id":"'+id+'"}]}';
	document.getElementById("appl_click").onclick=''
	$.ajax
	(
		{
			type:"POST",
			url:"../../test_js_get_appl/",
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
					if(obj_array[i]["application_status"]=='1')
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
				html += '<td id="completed_appl'+i+'">'+check_stat+'</td>'
				html += '<td align="center"><input id="appl_status'+i+'" type="checkbox" name="appl_status" '+check+'></td>'
				html += '<td id="comments'+i+'">'+obj_array[i]["violations"][0]+'</td>'
				html +='<td><a onclick="printLetter(this.id)" id="'+i+'" class="smoth btn gradiant-bg"><strong><font color="white">PRINT</font></strong><span></span></a></td>'

				
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
printLetter = function(clicked_id){
	Applicant_Id = '{"data" :[{"applicant_id":"'+document.getElementById("appl"+clicked_id).innerHTML+'"}]}'
	//$('#linkBtnUnitPrice').click(function() {
	//alert(document.getElementById("appl"+clicked_id).innerHTML)
	//});
	$.ajax
	(
		{
			type:"POST",
			url:"../../print_letter/",
			async:true,
			data: 
   				{
        			ssn: Applicant_Id 
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				 alert("Letters have been printed in your desired path")       		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
}

getCancel = function(id){
	var input = '{"data" :[{"date_id":"'+id+'"}]}';
	document.getElementById("get_cancel").onclick=''
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
					if(obj_array[i]["cancel_flag"]=='1')
					{
						check_cancel = 'checked'
					}
					else
					{
						check_cancel = ''
					}
					if(obj_array[i]["acceptance_packet"]=='1')
					{
						check = 'SENT'
					}
					else
					{
						check = 'NOT SENT'
					}
					//if(obj_array[i]["application_status"]=='1')
					//{
						check_stat = 'ACCEPTED'
					//}
					//else
					//{
						//check_stat = 'REJECTED'
					//}
				//if(obj_array[i]["check_in_status"]=='1'){complete = 'COMPLETE'}else{complete = 'INCOMPLETE'}
				
				var html = '<tr>';
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="firstname'+i+'">'+obj_array[i]["applicant_first_name"]+'</td>'
				html += '<td id="lastname'+i+'">'+obj_array[i]["applicant_last_name"]+'</td>'
				html += '<td id="completed_appl'+i+'">'+check_stat+'</td>'
				html += '<td align="center" id="appl_status'+i+'" name="appl_status" >'+check+'</td>'
				html += '<td align="center"><input id="cancel'+i+'" type="checkbox" name="appl_status" '+check_cancel+'></td>'
				html += '</tr>'
				$("#cancel_status").append(html);
				}
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
}