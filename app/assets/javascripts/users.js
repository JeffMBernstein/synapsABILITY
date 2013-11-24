$(document).ready(function() {
	
	$('#updateUserInfo').click(function(e) {

		e.preventDefault();
		e.stopPropagation();

		window.bootbox.alert("This was clicked");
		console.log("This was hit.");	
	});

});