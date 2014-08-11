// function InputKicker(event) {
// 		this.input = input_object;
// };

// InputKicker.addEvent(event) = function() {

// }; 

var oneWordAjax = function (url, word) {
				$.ajax({
				url: url,
				type: 'POST',
				dataType: 'json', 
				data: { key : word},
			})
			.done(function() {
				console.log("Sent ");
			})
			.fail(function() {
				console.log("error");
			});

}

function TagRelay() {
	this.tags = []
}; 

TagRelay.prototype.add = function(tag) {
	this.tags.push(tag)
}

TagRelay.prototype.sendAll = function(url){

	for (var i = 0; i < this.tags.length; i++) {
		var tag = this.tags[i]
		oneWordAjax(url, word)
	};
}

function ValueSender (location) {
		this.location = location
}

 $(document).ready(function() {
	console.log("done")
	$(".tag_input").on('keyup', function(event) {
		event.preventDefault();
		var code = event.keyCode || event.which;
 		if(code === 13) {
 			sendValue($this).val())
		console.log($(this).val())
	}
	});
});