/**
 * 
 */
$(document).ready(function()
	{
		 $("#name").blur(function() {
			var name = this.value;
			$.get("/buko//UploaderRegisteration",
			{
				name : name
			},
			function(res_data)
			{
				if(res_data!== "") {
					alert("Data: "+res_data);
				}
			});
		}); 
		
		 $("#email").blur(function() {
			var email = this.value;
			$.get("/buko//UploaderRegisteration",
			{
				email : email
			},
			function(res_data)
			{
				if(res_data!== "") {
					alert("Data: "+res_data);
				}
			});
		}); 
		
		 $("#confirmpassword").blur(function() {
			var password =$("#password").val();
			var confirmpassword = this.value;
			console.log(password);
			$.get("/buko//UploaderRegisteration",
			{
				password : password,
				confirmpassword : confirmpassword
			},
			function(res_data)
			{
				if(res_data!== "") {
					alert("Data: "+res_data);
				}
			});
		}); 
		
		 $("#phone").blur(function() {
			var phone = this.value;
			$.get("/buko//UploaderRegisteration",
			{
				phone : phone
			},
			function(res_data)
			{
				if(res_data!== "") {
					alert("Data: "+res_data);
				}
			});
		}); 
	});