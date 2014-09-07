//show the right room number on properties/id page
$("li [role='tab']").on('click', function() {

	var dest = $(this).attr('data-room');
  showTab(dest);

});

function showTab(tab) {
	$("#room-tab li").hide();
  $("#room-tab [data-room='" + tab + "']").show();
}