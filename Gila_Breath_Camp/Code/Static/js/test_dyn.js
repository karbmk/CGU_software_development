getTest1 = function(id)
{ 
	//alert(document.getElementById("").value);
	
	$.ajax({
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
    		});
	
	
	
	
}
