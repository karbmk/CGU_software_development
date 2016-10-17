on_open=function()
{	
	document.getElementsByTagName("body").onload=''

		$.ajax
	(
		{
			type:"GET",
			url:"../../application_status_get/",
			success:function(response)
			{
				var obj = $.parseJSON(response)
				document.getElementById("date_1").innerHTML = obj["data"][0]["display_date1"]
				document.getElementById("date_2").innerHTML = obj["data"][0]["display_date2"]
				document.getElementById("date_3").innerHTML = obj["data"][0]["display_date3"]
			},
			error:function(response)
			{
				location.reload()
			}
		}
	);
}
