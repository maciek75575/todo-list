$(document).ready(function() {
	$('.datepicker').pickadate({
	    selectMonths: false,
	    today: 'Dziś',
	    clear: 'Czyść',
	    close: 'Zamknij',
	    monthsFull: ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'],
	    monthsShort: ['Sty', 'Lut', 'Mar', 'Kwi', 'Maj', 'Cze', 'Lip', 'Sie', 'Wrz', 'Paz', 'Lis', 'Gru'],
	    weekdaysFull: ['Niedziela', 'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota'],
	    weekdaysShort: ['Nd', 'Pn', 'Wt', 'Sr', 'Cz', 'Pi', 'Sb'],
	    firstDay: 1,
	    min: true,
	    format: 'dddd, dd mmmm yyyy',
	    formatSubmit: 'yyyy/mm/dd',
	    hiddenName: true
    });
});