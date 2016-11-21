getTest1 = function(id)
{ //alert(id)
	var input = '{"data" :[{"date_id":"'+id+'"}]}';
	document.getElementById("check_click").onclick=''
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
				if(obj_array[i]["medical_form"]=='1'){med = 'checked'}else{med = ''}
				if(obj_array[i]["legal_form"]=='1'){leg = 'checked'}else{leg = ''}
				if(obj_array[i]["emergency_contact"]=='1'){emer = 'checked'}else{emer = ''}
				if(obj_array[i]["helmet"]=='1'){hel = 'checked'}else{hel = ''}
				if(obj_array[i]["boot"]=='1'){boot = 'checked'}else{boot = ''}
				if(obj_array[i]["sleeping_bag"]=='1'){sleeping_bag = 'checked'}else{sleeping_bag = ''}
				if(obj_array[i]["water_bottle"]=='1'){water_bottle = 'checked'}else{water_bottle = ''}
				if(obj_array[i]["sunscreen"]=='1'){sunscreen = 'checked'}else{sunscreen = ''}
				if(obj_array[i]["bugs_spray"]=='1'){bugs_spray = 'checked'}else{bugs_spray = ''}
				if(obj_array[i]["check_in_status"]=='1'){complete = 'COMPLETE'}else{complete = 'INCOMPLETE'}
				
				var html = '<tr>';
				html += '<td id="appl'+i+'">'+obj_array[i]["applicant_id"]+'</td>'
				html += '<td id="firstname'+i+'">'+obj_array[i]["applicant_first_name"]+'</td>'
				html += '<td id="lastname'+i+'">'+obj_array[i]["applicant_last_name"]+'</td>'
				html += '<td><input onchange="myFunction()" id="medical'+i+'" type="checkbox"  name="medical" '+med+'></td>'
				html += '<td><input onchange="myFunction()" id="legal'+i+'" type="checkbox" name="legal" '+leg+'></td>'
				html += '<td><input onchange="myFunction()" id="emergency'+i+'" type="checkbox" name="emergency" '+emer+'></td>'
				html += '<td><input onchange="myFunction()" id="helmet'+i+'" type="checkbox" name="helmet" '+hel+'></td>'
				html += '<td><input onchange="myFunction()" id="boot'+i+'" type="checkbox" name="boot" '+boot+'></td>'
				html += '<td><input onchange="myFunction()" id="sleeping_bag'+i+'" type="checkbox" name="sleeping_bag" '+sleeping_bag+'></td>'
				html += '<td><input onchange="myFunction()" id="water_bottle'+i+'" type="checkbox" name="water_bottle" '+water_bottle+'></td>'
				html += '<td><input onchange="myFunction()" id="sunscreen'+i+'" type="checkbox" name="sunscreen" '+sunscreen+'></td>'
				html += '<td><input onchange="myFunction()" id="bugs_spray'+i+'" type="checkbox" name="bugs_spray" '+bugs_spray+'></td>'
				html += '<td id="completed'+i+'">'+complete+'</td>'
				html +='<td><a href="/Static/Templates/index.html" class="smoth btn gradiant-bg"><strong><font color="white">PRINT</font></strong><span></span></a></td>'
				html += '</tr>'
				$("#checkin").append(html);
				}
        		
    		},
    		error: function(data)
    		{
        		alert("Sorry for the inconvinience. Server is not working. check if the server is working.");
      		}
    	}
  	);
		
}
