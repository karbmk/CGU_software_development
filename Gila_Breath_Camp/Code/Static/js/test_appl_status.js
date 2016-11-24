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
				if (check == 'NOT SENT')
				{html +='<td align="center">GO TO STATUS AND SEND ACCEPTANCE PACKET</td>'}
				else
				{html += '<td align="center"><input id="cancel'+i+'" type="checkbox" name="appl_status" '+check_cancel+'></td>'}
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

getPriority = function(id){
	var input = '{"data" :[{"date_id":"'+id+'"}]}';
	document.getElementById("get_priorities").onclick=''
	//alert("in get prior")
	$.ajax
	(
		{
			type:"POST",
			url:"../../priorities_get/",
			async:true,
			data: 
   				{
        			prior: input // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				for(i=0;i<obj_array.length;i++)
				{
					
				var html_appl_name = ''
				var html_guar_with = ''
				var html_appl_name_without = ''
				var html_guar_without = ''
				//alert(obj_array[i]["applicant_name_together_with"].length)
				for(var j=0;j<obj_array[i]["applicant_name_together_with"].length;j++){
					//alert(obj_array[i]["applicant_name_together_with"][j])
					html_appl_name +='<option>'+obj_array[i]["applicant_name_together_with"][j]+'</option>'
				}
				for(var j=0;j<obj_array[i]["guardian_ssn_together_with"].length;j++){
					html_guar_with +='<option>'+obj_array[i]["guardian_ssn_together_with"][j]+'</option>'
				}
				for(var j=0;j<obj_array[i]["applicant_name_together_with"].length;j++){
					html_appl_name_without +='<option>'+obj_array[i]["applicant_name_together_with"][j]+'</option>'
				}
				for(var j=0;j<obj_array[i]["guardian_ssn_not_together_with"].length;j++){
					html_guar_without +='<option>'+obj_array[i]["guardian_ssn_not_together_with"][j]+'</option>'
				}
				var html = '<tr>';
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="name'+i+'">'+obj_array[i]["applicant_name"]+'</td>'
				html += '<td id="appl_name'+i+'"><select id="sel_appl_name'+i+'" onchange="next_guar_ssn(this.id)" name="cmbCmpCrHdSal" class="form-control">'+html_appl_name+'</option></td>'
				html += '<td ><select id="guar_with'+i+'" name="cmbCmpCrHdSal" class="form-control">'+html_guar_with+'</option></td>'
				html += '<td ><select id="appl_name_without'+i+'" onchange="next_guar_without_ssn(this.id)"name="cmbCmpCrHdSal" class="form-control">'+html_appl_name_without+'</option></td>'
				html += '<td ><select id="guar_without'+i+'" name="cmbCmpCrHdSal" class="form-control">'+html_guar_without+'</option></td>'				
				html += '</tr>'
				$("#push_priorities").append(html);
				}
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
}

function next_guar_ssn(id){
	//alert(id)
	var e = document.getElementById(id);
	var strUser = e.options[e.selectedIndex].value;
	//alert(strUser)
	appl_name = '{"data" :[{"applicant_name_together_with":"'+strUser+'"}]}'
	$.ajax
	(
		{
			type:"POST",
			url:"../../priorities_get_guar_ssn/",
			async:true,
			data: 
   				{
        			prior: appl_name // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				
				//alert(obj_array[0]["guardian_ssn_together_with"])
				var select = document.getElementById("guar_with"+id.substr(id.length - 1));
				var length = select.options.length;
				for (i = 0; i < length; i++) {
					select.options[i] = null;
				}
				for(i=0;i<obj_array[0]["guardian_ssn_together_with"].length;i++)
				{
					$("#guar_with"+id.substr(id.length - 1)).append('<option>'+obj_array[0]["guardian_ssn_together_with"][i]+'</option>');
					//html_guar_with += html_guar_with +='<option>'+obj_array[0]["guardian_ssn_together_with"][i]+'</option>'
				}
				if(obj["message"]==""){
					
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

function next_guar_without_ssn(id){
	//alert(id)
	var e = document.getElementById(id);
	var strUser = e.options[e.selectedIndex].value;
	//alert(strUser)
	appl_name = '{"data" :[{"applicant_name_not_together_with":"'+strUser+'"}]}'
	$.ajax
	(
		{
			type:"POST",
			url:"../../priorities_get_guar_ssn/",
			async:true,
			data: 
   				{
        			prior: appl_name // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				//alert(obj_array[0]["guardian_ssn_not_together_with"])
				var select = document.getElementById("guar_without"+id.substr(id.length - 1));
				var length = select.options.length;
				for (i = 0; i < length; i++) {
					select.options[i] = null;
				}
				for(i=0;i<obj_array[0]["guardian_ssn_not_together_with"].length;i++)
				{
					$("#guar_without"+id.substr(id.length - 1)).append('<option>'+obj_array[0]["guardian_ssn_not_together_with"][i]+'</option>');
					//html_guar_with += html_guar_with +='<option>'+obj_array[0]["guardian_ssn_together_with"][i]+'</option>'
				}
				//html += '<td ><select id="guar_with'+i+'" name="cmbCmpCrHdSal" class="form-control">'+html_guar_with+'</option></td>'
				if(obj["message"]==""){
					
				}
				else{
					alert(obj["message"].replaceAll("|","\n"))
				}
				//$("#push_priorities").append(html);
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