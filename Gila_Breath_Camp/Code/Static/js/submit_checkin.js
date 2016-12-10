send_checkin = function(id)
{ 
	var input = '{"data" :[{"date_id":"'+id+'"}]}';
	document.getElementById("check_click").onclick=''
	var test = 0;
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
				
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	var array = [],med ='1',leg ='1',emer ='1',hel ='1',boot ='1',sleeping_bag ='1',water_bottle ='1',sunscreen ='1',bugs_spray ='1',completed ='1';
				for(i=0;i<test;i++)
				{
				if(document.getElementById("medical"+i).checked){med = '1'}else{med = '0'}
				if(document.getElementById("legal"+i).checked){leg = '1'}else{leg = '0'}
				if(document.getElementById("emergency"+i).checked){emer = '1'}else{emer = '0'}
				if(document.getElementById("helmet"+i).checked){hel = '1'}else{hel = '0'}
				if(document.getElementById("boot"+i).checked){boot = '1'}else{boot = '0'}
				if(document.getElementById("sleeping_bag"+i).checked){sleeping_bag = '1'}else{sleeping_bag = '0'}
				if(document.getElementById("water_bottle"+i).checked){water_bottle = '1'}else{water_bottle = '0'}
				if(document.getElementById("sunscreen"+i).checked){sunscreen = '1'}else{sunscreen = '0'}
				if(document.getElementById("bugs_spray"+i).checked){bugs_spray = '1'}else{bugs_spray = '0'}
				if(document.getElementById("completed"+i).innerText=="COMPLETE"){completed = '1'}else{completed = '0'}
				
				var camp_time = "2017-12-11 00:00:00.000000"
				$.ajax
				(
					{
					type:"POST",
					url:"../../application_status_get/",
					async:false,
					success:function(response){
					var obj = $.parseJSON(resopnse)
					if(id==1)
					{
						camp_time = obj["data"][0]["camp_time_slots1"]
					}
					else if(id==2)
					{
						camp_time = obj["data"][0]["camp_time_slots2"]
					}
					else if(id==3)
					{
						camp_time = obj["data"][0]["camp_time_slots3"]
					}
					}
					}
				);
				
				
				var k = '{"applicant_id":"'+document.getElementById("appl"+i).innerText+'", "applicant_first_name":"'+document.getElementById("firstname"+i).innerText+'","applicant_last_name":"'+document.getElementById("lastname"+i).innerText+'","medical_form":"'+med+'","legal_form":"'+leg+'","emergency_contact":"'+emer+'","helmet":"'+hel+'","boot":"'+boot+'","sleeping_bag":"'+sleeping_bag+'","water_bottle":"'+water_bottle+'","sunscreen":"'+sunscreen+'","bugs_spray":"'+bugs_spray+'","check_in_status":"'+completed+'","camp_time_slots":"'+camp_time+'"}'
				array.push(k)
				
				}
        		var input1 = '{"data":['+array+']}'
	$.ajax
	(
		{
			type:"POST",
			url:"../../test_submit_checkin/",
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
				location.reload()
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	
	
}


send_cancel = function(id){
	var input = '{"data" :[{"date_id":"'+id+'"}]}';
	document.getElementById("check_click").onclick=''
	var test = 0;
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
				
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	var array = [];
	
	
	for(i=0;i<test;i++)
				{
				//var can_flag = '0'
				if(document.getElementById("cancel"+i).checked){can_flag = '1'}else{can_flag = '0'}
				
				var camp_time = "2017-12-11 00:00:00.000000"
				$.ajax
				(
					{
					type:"POST",
					url:"../../application_status_get/",
					async:false,
					success:function(response){
					var obj = $.parseJSON(resopnse)
					if(id==1)
					{
						camp_time = obj["data"][0]["camp_time_slots1"]
					}
					else if(id==2)
					{
						camp_time = obj["data"][0]["camp_time_slots2"]
					}
					else if(id==3)
					{
						camp_time = obj["data"][0]["camp_time_slots3"]
					}
					}
					}
				);
				
				
				var k = '{"applicant_id":"'+document.getElementById("appl"+i).innerText+'", "cancel_flag":"'+can_flag+'"}'
				//if(can_flag=="1"){
				array.push(k)
				//}
				//else{}
				
				}
			
        		var input1 = '{"data":['+array+']}'
	$.ajax
	(
		{
			type:"POST",
			url:"../../send_cancel/",
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
				location.reload()
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	
}

send_priority = function(id){
	var input = '{"data" :[{"date_id":"'+id+'"}]}';
	
	document.getElementById("check_click").onclick=''
	var test = 0;
	$.ajax
	(
		{
			type:"POST",
			url:"../../priorities_get/",
			async:false,
			data: 
   				{
        			prior: input // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				test = obj_array.length
				//alert(test)
				
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
	var array = [];
				for(i=0;i<test;i++)
				{
				//if(document.getElementById("medical"+i).checked){med = '1'}else{med = '0'}
				//if(document.getElementById("legal"+i).checked){leg = '1'}else{leg = '0'}
				//if(document.getElementById("emergency"+i).checked){emer = '1'}else{emer = '0'}
				//if(document.getElementById("helmet"+i).checked){hel = '1'}else{hel = '0'}
				//if(document.getElementById("boot"+i).checked){boot = '1'}else{boot = '0'}
				//if(document.getElementById("sleeping_bag"+i).checked){sleeping_bag = '1'}else{sleeping_bag = '0'}
				//if(document.getElementById("water_bottle"+i).checked){water_bottle = '1'}else{water_bottle = '0'}
				//if(document.getElementById("sunscreen"+i).checked){sunscreen = '1'}else{sunscreen = '0'}
				//if(document.getElementById("bugs_spray"+i).checked){bugs_spray = '1'}else{bugs_spray = '0'}
				//if(document.getElementById("completed"+i).innerText=="COMPLETE"){completed = '1'}else{completed = '0'}
				
				
				//var option = this.options[this.selectedIndex];
				//alert($('#sel_appl_name'+i).text(this.options[this.selectedIndex].value));
				//alert($( "#sel_appl_name"+i+" option:selected" ).text())
				//alert($('#sel_appl_name'+i).val($(this).find(":selected").text()))
				var k = '{"applicant_id":"'+document.getElementById("appl"+i).innerText+'", "name":"'+document.getElementById("name"+i).innerText+'","applicant_name_together_with":"'+$( "#sel_appl_name"+i+" option:selected" ).text()+'","applicant_id_together_with":"'+$( "#guar_with"+i+" option:selected" ).text()+'","applicant_name_not_together_with":"'+$( "#appl_name_without"+i+" option:selected" ).text()+'","applicant_id_not_together_with":"'+$( "#guar_without"+i+" option:selected" ).text()+'"}'
				array.push(k)
				
				}
        		var input1 = '{"data":['+array+']}'
				//alert(input1)
	$.ajax
	(
		{
			type:"POST",
			url:"../../priorities_set_submit/",
			async:false,
			data: 
   				{
        			prior: input1 // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				var obj = $.parseJSON(data)
				alert(obj["message"])
				location.reload()
				//document.getElementById("reggg").removeClass("active");
				//document.getElementById("get_priorities").addClass("active")
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
}





submitBunk = function(id){
	var input = '{"data" :[{"date_id":"'+id+'","no_of_bunkhouses":"'+document.getElementById("bunk_number").value+'"}]}';
	document.getElementById("get_bunk").onclick=''
	if(isNaN(document.getElementById("bunk_number").value) || parseInt(document.getElementById("bunk_number").value)%2 != 0 || parseInt(document.getElementById("bunk_number").value)==0){
		alert("Enter valid Bunkhouse number \nBunkhouse number should be a multiple of 2")
		return;
	}
	$("#pop_bunk").empty()
	$.ajax
	(
		{
			type:"POST",
			url:"../../assignment_bunkhouse/",
			async:true,
			data: 
   				{
        			bunk: input // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				//alert(obj_array.length)
				var html = '<tr><th>Application no.</th><th>Bunkhouse No.</th><th>Applicant Name</th><th>GENDER</th><th>AGE</th></tr>';
				$("#pop_bunk").append(html);
				for(i=0;i<obj_array.length;i++)
				{
				//if(obj_array[i]["medical_form"]=='1'){med = 'checked'}else{med = ''}
				//if(obj_array[i]["legal_form"]=='1'){leg = 'checked'}else{leg = ''}
				//if(obj_array[i]["emergency_contact"]=='1'){emer = 'checked'}else{emer = ''}
				//if(obj_array[i]["helmet"]=='1'){hel = 'checked'}else{hel = ''}
				//if(obj_array[i]["boot"]=='1'){boot = 'checked'}else{boot = ''}
				//if(obj_array[i]["sleeping_bag"]=='1'){sleeping_bag = 'checked'}else{sleeping_bag = ''}
				//if(obj_array[i]["water_bottle"]=='1'){water_bottle = 'checked'}else{water_bottle = ''}
				//if(obj_array[i]["sunscreen"]=='1'){sunscreen = 'checked'}else{sunscreen = ''}
				//if(obj_array[i]["bugs_spray"]=='1'){bugs_spray = 'checked'}else{bugs_spray = ''}
				//if(obj_array[i]["check_in_status"]=='1'){complete = 'COMPLETE'; sel_all="checked"}else{complete = 'INCOMPLETE';sel_all=''}
				
				var html = '<tr>';
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="bunk'+i+'">'+obj_array[i]["bunkhouse_id"]+'</td>'
				html += '<td id="lastname'+i+'">'+obj_array[i]["applicant_last_name"]+','+obj_array[i]["applicant_first_name"]+'</td>'
				html += '<td id="gen'+i+'">'+obj_array[i]["applicant_gender"]+'</td>'
				html += '<td id="age'+i+'">'+obj_array[i]["applicant_age"]+'</td>'
				//html += '<td><input onchange="select_all('+i+')" id="sel_all'+i+'" type="checkbox"  name="select" '+sel_all+'></td>'
				//html += '<td><input onchange="myFunction()" id="medical'+i+'" type="checkbox"  name="medical" '+med+'></td>'
				//html += '<td><input onchange="myFunction()" id="legal'+i+'" type="checkbox" name="legal" '+leg+'></td>'
				//html += '<td><input onchange="myFunction()" id="emergency'+i+'" type="checkbox" name="emergency" '+emer+'></td>'
				//html += '<td><input onchange="myFunction()" id="helmet'+i+'" type="checkbox" name="helmet" '+hel+'></td>'
				//html += '<td><input onchange="myFunction()" id="boot'+i+'" type="checkbox" name="boot" '+boot+'></td>'
				//html += '<td><input onchange="myFunction()" id="sleeping_bag'+i+'" type="checkbox" name="sleeping_bag" '+sleeping_bag+'></td>'
				//html += '<td><input onchange="myFunction()" id="water_bottle'+i+'" type="checkbox" name="water_bottle" '+water_bottle+'></td>'
				//html += '<td><input onchange="myFunction()" id="sunscreen'+i+'" type="checkbox" name="sunscreen" '+sunscreen+'></td>'
				//html += '<td><input onchange="myFunction()" id="bugs_spray'+i+'" type="checkbox" name="bugs_spray" '+bugs_spray+'></td>'
				//html += '<td id="completed'+i+'">'+complete+'</td>'
				html += '</tr>'
				$("#pop_bunk").append(html);
				}
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
}

submitTribe = function(id){
	var input = '{"data" :[{"date_id":"'+id+'","no_of_tribes":"'+document.getElementById("tribe_number").value+'"}]}';
	document.getElementById("get_tribe").onclick=''
	if(isNaN(document.getElementById("tribe_number").value) || parseInt(document.getElementById("tribe_number").value)%2 != 0 || parseInt(document.getElementById("tribe_number").value)==0){
		alert("Enter valid Tribe number \nBunkhouse number should be a multiple of 2")
		return;
	}
	$("#pop_tribe").empty()
	$.ajax
	(
		{
			type:"POST",
			url:"../../assignment_tribe/",
			async:true,
			data: 
   				{
        			tribe: input // from form
        		},
    		dataType: "text",
    		success: function(data) 
    		{
				
				var obj = $.parseJSON(data)
				obj_array = obj["data"]
				//alert(obj_array.length)
				var html = '<tr><th>Application no.</th><th>Tribe No.</th><th>Applicant Name</th><th>GENDER</th><th>AGE</th></tr>';
				$("#pop_tribe").append(html);
				for(i=0;i<obj_array.length;i++)
				{
				//if(obj_array[i]["medical_form"]=='1'){med = 'checked'}else{med = ''}
				//if(obj_array[i]["legal_form"]=='1'){leg = 'checked'}else{leg = ''}
				//if(obj_array[i]["emergency_contact"]=='1'){emer = 'checked'}else{emer = ''}
				//if(obj_array[i]["helmet"]=='1'){hel = 'checked'}else{hel = ''}
				//if(obj_array[i]["boot"]=='1'){boot = 'checked'}else{boot = ''}
				//if(obj_array[i]["sleeping_bag"]=='1'){sleeping_bag = 'checked'}else{sleeping_bag = ''}
				//if(obj_array[i]["water_bottle"]=='1'){water_bottle = 'checked'}else{water_bottle = ''}
				//if(obj_array[i]["sunscreen"]=='1'){sunscreen = 'checked'}else{sunscreen = ''}
				//if(obj_array[i]["bugs_spray"]=='1'){bugs_spray = 'checked'}else{bugs_spray = ''}
				//if(obj_array[i]["check_in_status"]=='1'){complete = 'COMPLETE'; sel_all="checked"}else{complete = 'INCOMPLETE';sel_all=''}
				
				var html = '<tr>';
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="tribe'+i+'">'+obj_array[i]["tribe_id"]+'</td>'
				html += '<td id="lastname'+i+'">'+obj_array[i]["applicant_last_name"]+','+obj_array[i]["applicant_first_name"]+'</td>'
				html += '<td id="gen'+i+'">'+obj_array[i]["applicant_gender"]+'</td>'
				html += '<td id="age'+i+'">'+obj_array[i]["applicant_age"]+'</td>'
				//html += '<td><input onchange="myFunction()" id="legal'+i+'" type="checkbox" name="legal" '+leg+'></td>'
				//html += '<td><input onchange="myFunction()" id="emergency'+i+'" type="checkbox" name="emergency" '+emer+'></td>'
				//html += '<td><input onchange="myFunction()" id="helmet'+i+'" type="checkbox" name="helmet" '+hel+'></td>'
				//html += '<td><input onchange="myFunction()" id="boot'+i+'" type="checkbox" name="boot" '+boot+'></td>'
				//html += '<td><input onchange="myFunction()" id="sleeping_bag'+i+'" type="checkbox" name="sleeping_bag" '+sleeping_bag+'></td>'
				//html += '<td><input onchange="myFunction()" id="water_bottle'+i+'" type="checkbox" name="water_bottle" '+water_bottle+'></td>'
				//html += '<td><input onchange="myFunction()" id="sunscreen'+i+'" type="checkbox" name="sunscreen" '+sunscreen+'></td>'
				//html += '<td><input onchange="myFunction()" id="bugs_spray'+i+'" type="checkbox" name="bugs_spray" '+bugs_spray+'></td>'
				//html += '<td id="completed'+i+'">'+complete+'</td>'
				html += '</tr>'
				$("#pop_tribe").append(html);
				}
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
}