$(document).on("ready page:change", function() {
	// when we load the page, hide all the items with the class of 'reply-form'
	$('.reply-form').hide();

	// put in the event handler to hide all / show specific section
	$('.reply-link').on("click", function() {
		$('.reply-form').hide();
		var id = $(this).attr("id");
		var reply_form = "#childForm" + id;
		$(reply_form).show();
	});
});