/**
 * 
 */

function setLang(pagename) {
	var language = 'ita';
	$.ajax({
		url : '/WAPP/languages/' + pagename,
		success : function(xml) {
			$(xml).find('translation').each(function() {
				var id = $(this).attr('id');
				var text = $(this).find(language).text();
				$("#" + id).html(text);
			});

		}
	});
	$.ajax({
		url : '/WAPP/languages/navbar.xml',
		success : function(xml2) {
			$(xml2).find('translation').each(function() {
				var id = $(this).attr('id');
				var text = $(this).find(language).text();
				$("#" + id).html(text);
			});

		}
	});
};

