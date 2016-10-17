send_checkin = function(id)
{ 
	//alert(document.getElementById("").value);
	alert("in js")
	var input = '{"data" :[{"date_id":"1"}]}';
	//alert(typeof(input))
	//location.reload()
	//$("#register").className='';
	//$("#check").className = 'active'
	//location.reload()
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
        		alert("chutiye password galat kiya hoga dekh le");
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
				if(document.getElementById("completed"+i).checked){completed = '1'}else{completed = '0'}
				
				camp_time = "2017-01-08 00:00:00.000000"
				
				var k = '{"applicant_id":"'+document.getElementById("appl"+i).innerText+'", "applicant_first_name":"'+document.getElementById("firstname"+i).innerText+'","applicant_last_name":"'+document.getElementById("lastname"+i).innerText+'","medical_form":"'+med+'","legal_form":"'+leg+'","emergency":"'+emer+'","helmet":"'+hel+'","boot":"'+boot+'","sleeping_bag":"'+sleeping_bag+'","water_bottle":"'+water_bottle+'","sunscreen":"'+sunscreen+'","bugs_spray":"'+bugs_spray+'","check_in_status":"'+completed+'","camp_time_slots":"'+camp_time+'"}'
				array.push(k)
				
				}
				//alert(data)
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
				//obj_array = obj["data"]
				alert(obj["message"])
				//test = obj_array.length
				//alert(data)
        		
    		},
    		error: function(data)
    		{
        		debugger;
        		alert("chutiye password galat kiya hoga dekh le");
      		}
    	}
  	);
	
	
}
