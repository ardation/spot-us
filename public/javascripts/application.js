// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){ 
	$('#equalize').equalHeights();
	$(document).pngFix();
	$('#example > ul').tabs();
});
// Flash dismiss - CARM TALK TO DESI WE ARE MISSING jslivequery.js for this
/*$('.flash .dismiss a').livequery('click', function(event) {
  $(this).parents('.flash').slideUp();
  return false;
});*/


$("a").click(function(){
  $(".navigation a.selected").removeClass("selected");  
  // remove previous class if there is any
  $(this).addClass("selected");                                      
  // add class to the clicked link
  return false;                                                           
  // this prevents browser from following clicked link
});

function toggle_divs(div1, div2) {
  jQuery(div1).toggle();
  jQuery(div2).toggle();
}

// jQuery("#toggle_pledge_button").livequery("click", toggle_divs("#pledge_button", "#pledge_custom"));


