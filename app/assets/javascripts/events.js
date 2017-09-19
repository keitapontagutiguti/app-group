// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function(){

	var table = $("table");

	for (var i = table.length - 1; i >= 0; i--) {

	var eventCapacity = parseInt( $(".eventCapacity").eq(i).val() ),
		eventJoins = parseInt( $(".eventJoins").eq(i).val() ),
		capacityRest = eventCapacity - eventJoins;

	  if (capacityRest == 0) {
	    $(".capacity-count").eq(i).addClass("label-default");
	  } else if (capacityRest == 1) {
	    $(".capacity-count").eq(i).addClass("label-danger");
	  } else if (capacityRest < 6) {
	    $(".capacity-count").eq(i).addClass("label-warning");
	  } else {
	    $(".capacity-count").eq(i).addClass("label-success");
	  }

	}




});
