// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require mustache
//= require bootstrap-sprockets
//= require bootstrap-filestyle
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require_tree .

//show the right room number on properties/id page

$(document).ready(function() {
$(":file").filestyle({size: "sm"});


$("li [role='tab']").on('click', function() {

	var dest = $(this).attr('data-room');
  showTab(dest);
  
});

function showTab(tab) {
	$("#room-tab li").hide();
  $("#room-tab [data-room='" + tab + "']").show();
}

$("li [role='tab']").on('click', function() {

	var dest = $(this).attr('data-user');
	$('#form_for_user').attr('action', "/user/" + dest + "/reviews")

});

$(".input-thougths").on('click', function(event){
	$(this).removeClass().addClass("input-thougths-big");
});


	$('.new_review').on('submit', function(event) {
		event.preventDefault();

		$.post(this.action, $(this).serialize(), function(response) {

			//$('ul.property-reviews-list').prepend('<li class="property-reviews-list">' + response.thoughts + '</li>')
			
		var template = $('#review-template').html();
		var output = Mustache.render(template, response);
		$("#target").html(output);
			

		}).error(function(){
			alert('Sorry put stars');
		});
	});


});




