

$(document).ready(function() {

	$(".voter").on('click', function(event) {
		event.preventDefault();
		var userVote = {}
			  userVote["is_upvote"] = $(this).data("true"); 
				userVote["owner"] = $(this).data("route"); 
		var self = $(this)
		$.ajax({
			url: '/votes',
			type: 'POST',
			dataType: 'json',
			data: {vote: userVote},
		})
		.done(function(response) {
			console.log("success");
			self.css( "background-color", "yellow" )
		})
		.fail(function() {
			console.log("error");
		})
	});
});