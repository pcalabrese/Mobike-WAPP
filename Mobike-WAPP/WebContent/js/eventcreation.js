$('document').ready(function() {
		$("navbar").load('/WAPP/template/navbar.jsp', function() {
		$('user').append(nickname);
		$('#mevent').addClass("active");
		});

	$('footer').load('/WAPP/template/footer.jsp');

	initDatepicker();

	$.material.init();

	$.getJSON("/WAPP/ops/getitineraries", function(data) {
			var result = data;
			makeTable(data); 
			});

	$('#resetbtn').on('click', function() {
		$('form')[0].reset(); 
		});

	$('#uploadbtn').on('click', function() {
		saveEvent();
		});

	function makeTable(data) {
			for (i = 0; i < data.length; i++) {
					$("tbody").append("<tr><td><input type=\"radio\" id=\"routeId\" name=\"routeId\" value=\""
										+ data[i].id
										+ "\"> <a href=\"javascript:apri(\'http://mobike.ddns.net/WAPP/itineraries/"
										+ data[i].id + "\');\">"
										+ data[i].id
										+ "</a></td><td>"
										+ data[i].name
										+ "</td><td>"
										+ data[i].length / 1000
										+ "</td><td>"
										+ data[i].duration / 60
										+ "</td><td>"
										+ data[i].bends
										+ "</td><td>"
										+ data[i].difficulty
										+ "</td></tr>");
						}
					}

				});

function saveEvent() {
	$('#saveModal').modal('show');

	$('#sno').on('click', function() {
		$('#saveModal').modal('hide');
	});

	$('#syes').on('click',function() {
						var json = {
							name : $('#name').val(),
							description : $('#desc').val(),
							startlocation : $('#startlocation').val(),
							startdate : $('#eventdate').val() + " "
									+ $('#time').val() + ":00",
							invites : $('#invites').val(),
							routeId : $("#myForm input[type='radio']:checked").val()
						};

						$.ajax({
								type : "POST",
								processData : false,
								contentType : 'application/json',
								url : "/WAPP/ops/events/newevent",
								data : JSON.stringify(json),
								success : function(data) {
										$('#mod-body').text("Thank you! Your event has been succesfully saved!");
										onUploadCallBack();
										window.location.assign("/WAPP/events/" + data);
									},
									error : function(data) {
										$('#mod-body').text("We're sorry an error occured, please Try again later!");
										onUploadCallBack();
									},
									failure : function(data) {
										$('#mod-body').text("We're sorry an error occured, please Try again later!");
										onUploadCallBack();
									}
								});
					});
};

function onUploadCallBack() {
	$('#sno').hide();
	$('#syes').hide();
	$('#sclose').show();
	$('#sclose').on('click', function() {
		$('#saveModal').modal('hide');
	})

};

function apri(url) {
	newin = window.open(url, 'Route Preview',
			'scrollbars=yes,resizable=yes,width=600,height=600,toolbar=no');
}

function initDatepicker() {
	$("#eventdate").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 1,
		dateFormat : "yy/mm/dd",
	}).addClass("datepicker");
};