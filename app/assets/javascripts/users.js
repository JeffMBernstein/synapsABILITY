$(document).ready(function() {
	
	$('#updateUserInfo').click(function(e) {

		e.preventDefault();
		e.stopPropagation();

		var id = $(this).attr('data-userId');

		$.ajax('/users/#{id}/update.json', {
			username: $('#username').val(),
			first_name: $('#first_name').val(),
			last_name: $('#last_name').val(),
			email: $('#email').val(),
			password: $('#password').val(),
			password_confirmation: $('#password_confirmation').val(),
			bio: $('#bio').val(),
			address: $('#address').val(),
			city: $('#city').val(),
			province: $('#province').val()
		}, function(data) {
			if(data){
				window.bootbox.alert("Profile updated");
				window.location.reload(true);
			} else {
				window.bootbox.error("Profile update unsuccessful");	
			}
		});

	});

});