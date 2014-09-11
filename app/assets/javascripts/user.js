$("li [role='tab']").on('click', function() {

	var dest = $(this).attr('data-user');
	$('#form_for_user').attr('action', "/user/" + dest + "/reviews")

});