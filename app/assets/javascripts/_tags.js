
function TagRelay() {
	this.tags = []
}; 

TagRelay.prototype.add = function(tag) {
	this.tags.push(tag)
}

TagRelay.prototype.sendAll = function(url){

	for (var i = 0; i < this.tags.length; i++) {
		var tagTitle = this.tags[i]
			$.ajax({
				url: url,
				type: 'Post',
				dataType: 'json', 
				data: {tag: tagTitle},
			})
			.done(function() {
				console.log("Sent ");
			})
			.fail(function() {
				console.log("error");
			});
	};
}


// $(document).ready(function() {
// 	console.log("done")
// 	$(".tag_input").on('keyup', function(event) {
// 		event.preventDefault();
// 		var code = event.keyCode || event.which;
//  		if(code === 13) {
// 		console.log($(this).val())
// 	}
// 	});
// });