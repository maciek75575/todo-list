$(document).ready(function() {
	$('div.colpicd').height($('div.colpicd').width());
	$('i.colpicd').css("fontSize", ($('div.colpicd').height())/2.);
	$(window).resize(function(){
		$('div.colpicd').height($('div.colpicd').width());
		$('i.colpicd').css("fontSize", ($('div.colpicd').height())/2.);
	});
});