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
				html += '<td id="appl_print'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="firstname'+i+'">'+obj_array[i]["applicant_first_name"]+'</td>'
				html += '<td id="lastname'+i+'">'+obj_array[i]["applicant_last_name"]+'</td>'
				html += '<td id="completed_appl'+i+'">'+check_stat+'</td>'
				if(check_stat=="ACCEPTED"){
				html += '<td align="center"><input id="appl_status'+i+'" type="checkbox" name="appl_status" '+check+'></td>'
				}
				else{
					html += '<td id="appl_status'+i+'"></td>'
				}
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
	alert(clicked_id)
	Applicant_Id = '{"data" :[{"applicant_id":"'+document.getElementById("appl_print"+clicked_id).innerHTML+'"}]}'
	alert(Applicant_Id)
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
				//alert(data)
				var myWindow = window.open("","PRINT", "_blank");
				myWindow.document.write("<p>"+data.replaceAll("\n","<br>")+"</p>");
				myWindow.print()
				//alert("Letters have been printed in your desired path")       		
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
				{html +='<td style="font-size: 12px;" align="center" id="cancel'+i+'">NOTICE SHOULD BE SENT BEFORE CANCELLING AN APPLICATION</td>'}
				else
				{html += '<td align="center"><input id="cancel'+i+'" type="checkbox" name="appl_status" '+check_cancel+'></td>'}
				html += '<td>'+obj_array[i]["mailing_date"]+'</td>'
				html += '<td>'+obj_array[i]["cancel_date"]+'</td>'
				html += '<td>'+obj_array[i]["refund"]+'</td>'
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
					html_appl_name +='<option value="'+obj_array[i]["applicant_name_together_with"][j]+'">'+obj_array[i]["applicant_name_together_with"][j]+'</option>'
				}
				for(var j=0;j<obj_array[i]["applicant_id_together_with"].length;j++){
					html_guar_with +='<option value="'+obj_array[i]["applicant_id_together_with"][j]+'">'+obj_array[i]["applicant_id_together_with"][j]+'</option>'
				}
				for(var j=0;j<obj_array[i]["applicant_name_not_together_with"].length;j++){
					html_appl_name_without +='<option value="'+obj_array[i]["applicant_name_not_together_with"][j]+'">'+obj_array[i]["applicant_name_not_together_with"][j]+'</option>'
				}
				for(var j=0;j<obj_array[i]["applicant_id_not_together_with"].length;j++){
					html_guar_without +='<option value="'+obj_array[i]["applicant_id_not_together_with"][j]+'">'+obj_array[i]["applicant_id_not_together_with"][j]+'</option>'
				}
				var html = '<tr>';
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="name'+i+'">'+obj_array[i]["applicant_name"]+'</td>'
				html += '<td id="appl_name'+i+'"><select id="sel_appl_name'+i+'" onchange="next_guar_ssn('+i+')" name="cmbCmpCrHdSal" class="form-control">'+html_appl_name+'</option></td>'
				html += '<td ><select id="guar_with'+i+'" name="cmbCmpCrHdSal" class="form-control">'+html_guar_with+'</option></td>'
				html += '<td ><select id="appl_name_without'+i+'" onchange="next_guar_without_ssn('+i+')"name="cmbCmpCrHdSal" class="form-control">'+html_appl_name_without+'</option></td>'
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
	var e = document.getElementById("sel_appl_name"+id);
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
				
				var select1 = document.getElementById("guar_with"+id);
				select1.options.length = 0;
				
				for(i=0;i<obj_array[0]["applicant_id_together_with"].length;i++)
				{
					//alert(obj_array[0]["applicant_id_together_with"][i])
					$("#guar_with"+id).append('<option>'+obj_array[0]["applicant_id_together_with"][i]+'</option>');
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
	var e = document.getElementById("appl_name_without"+id);
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
				var select = document.getElementById("guar_without"+id);
				var length = select.options.length;
				for (i = 0; i < length; i++) {
					select.options[i] = null;
				}
				for(i=0;i<obj_array[0]["applicant_id_not_together_with"].length;i++)
				{
					$("#guar_without"+id).append('<option>'+obj_array[0]["applicant_id_not_together_with"][i]+'</option>');
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

var global_application_date = ""

Update_get = function(id){
	var e = document.getElementById("c_appl_id").value;
	//var strUser = e.options[e.selectedIndex].value;
	//alert(strUser)
	appl_id = '{"data" :[{"applicant_id":"'+e+'"}]}'
	$.ajax
	(
		{
			type:"POST",
			url:"../../update_get_application/",
			async:true,
			data: 
   				{
        			prior: appl_id // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				global_application_date = obj_array[0][0]["application_date"]
				//alert(obj_array[0][0]["application_date"])
				//alert("success")
				document.getElementById("c_first_name_up").value = obj_array[0][0]["applicant_first_name"]
				document.getElementById("c_last_name_up").value = obj_array[0][0]["applicant_last_name"]
				document.getElementById("c_age_up").value = obj_array[0][0]["applicant_age"]
				document.getElementById("c_sex_up").value = obj_array[0][0]["applicant_gender"]
				document.getElementById("c_address_up").value = obj_array[0][0]["applicant_address"]
				document.getElementById("g_ssn_up").value = obj_array[0][0]["guardian_ssn"]
				document.getElementById("g_first_name_up").value = obj_array[0][0]["guardian_first_name"]
				document.getElementById("g_last_name_up").value = obj_array[0][0]["guardian_last_name"]
				document.getElementById("g_address_up").value = obj_array[0][0]["guardian_address"]
				document.getElementById("g_contact_info_up").value = obj_array[0][0]["guardian_contact_number"]
				document.getElementById("g_emergency_contact_up").value = obj_array[0][0]["emergency_contact"]
				document.getElementById("g_payment_up").value = obj_array[0][0]["payment"]
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
}


set_update = function(id){
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
			applicant_id:document.getElementById("c_appl_id").value,
			user_id:"1",
			bunkhouse_id:"",
			tribe_id:"",
			camp_time_slots:camp_slots,
            applicant_first_name:document.getElementById("c_first_name_up").value,
            applicant_last_name:document.getElementById("c_last_name_up").value,
            applicant_age:document.getElementById("c_age_up").value,
            applicant_gender:document.getElementById("c_sex_up").value,
            applicant_address:document.getElementById("c_address_up").value,
			guardian_ssn:document.getElementById("g_ssn_up").value,
            guardian_first_name:document.getElementById("g_first_name_up").value,
            guardian_last_name:document.getElementById("g_last_name_up").value,
            guardian_address:document.getElementById("g_address_up").value,
            guardian_contact_number:document.getElementById("g_contact_info_up").value,
			application_date:global_application_date,
            emergency_contact:document.getElementById("g_emergency_contact_up").value,
            payment:document.getElementById("g_payment_up").value,
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
			url:"../../update_set_application/",
			async:true,
			data: 
   				{
        			prior: input // from form
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