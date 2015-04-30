$('document').ready(function() {
	$("navbar").load('/WAPP/template/navbar.jsp', function() {
		$('user').append(nickname);
		$('#mevents').addClass("active");
	});
	
	initTooltip();
	
	$('footer').load('/WAPP/template/footer.jsp');

	$.material.init();

	printEvents();
	
	$('.form-control').on('keyup change', printEvents);
	
	$('#newbtn').on('click', function(){
		window.location.assign("/WAPP/events/new");
	});
	
	initDatepicker();
});

function initTooltip(){
    $('legend').tooltip();
 };
 
function printEvents() {
	$('.list-group').empty();
	for (i = 0; i < events.length; i++) {
		if ((events[i].name.toLowerCase().indexOf(
				$('#name').val().toLowerCase()) != -1)
				&& (events[i].startlocation.toLowerCase().indexOf($('#startloc').val().toLowerCase()) != -1)
				&& (($('#fromdate').val() == "") || ($.datepicker.parseDate("yy/mm/dd", events[i].startdate) >= $.datepicker.parseDate("yy/mm/dd", $('#fromdate').val())))
				&& (($('#todate').val() == "") || ($.datepicker.parseDate("yy/mm/dd", events[0].startdate) <= $.datepicker.parseDate("yy/mm/dd", $('#todate').val()))))
			$('.list-group')
					.append(
							"<div class=\"list-group-item\"><div class=\"row-action-primary\"><i class=\"mdi-social-group\"></div></i><div class=\"row-content\"><div class=\"least-content\">"
									+ events[i].owner.nickname
									+ "</div><h4 class=\"list-group-item-heading\"><a href=\"./events/"
									+ events[i].id
									+ "\">"
									+ events[i].name
									+ "</a></h4><p class=\"list-group-item-text\" style=\"text-align:right\"> <span class= \"mdi-maps-place\" style=\"font-size:22px\"></span>"
									+ events[i].startlocation
									+ "<span class= \"mdi-editor-insert-invitation\" style=\"font-size:22px; margin-left:20px\"></span>"
									+ events[i].startdate
									+ "</p><span><span class=\"mdi-notification-event-available text-success\" style=\"font-size:22px; margin-right:10px\">"
									+ events[i].acceptedSize
									+ "</span></span><span><span class=\"mdi-notification-event-note text-warning\" style=\"font-size:22px; margin-right:10px\">"
									+ events[i].invitedSize
									+ "</span></span><span><span class=\"mdi-notification-event-busy text-danger\" style=\"font-size:22px; margin-right:10px\">"
									+ events[i].refusedSize
									+ "</span></span></p></div></div>"
									+ "<div class=\"list-group-separator\"></div>");
		var targ = $('.mdi-social-group').last();
		if(events[i].userState==0)
			targ.addClass('greyed');
		if(events[i].userState==1)
			targ.addClass('invited');
		if(events[i].userState==2)
			targ.addClass('done');
		if(events[i].userState==3)
			targ.addClass('refused');
		
			
	}
};


function initDatepicker() {
	$("#fromdate").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 1,
		dateFormat : "yy/mm/dd",
		onClose : function(selectedDate) {
			$("#todate").datepicker("option", "minDate", selectedDate);
		}
	}).addClass("datepicker");
	$("#todate").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 1,
		dateFormat : "yy/mm/dd",
		onClose : function(selectedDate) {
			$("#fromdate").datepicker("option", "maxDate", selectedDate);
		}
	});
};

