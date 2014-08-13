var divSearcher = function (el) {
	values = [];
	var tags = el.children()
	for (var i = 0; i < tags.length; i++) {
		values.push(tags[i].val());
	};
	return values
}


//Take Input
//Send to Relay
//Send to Div Maker
//Trigger Relay on submit question: to ajax
var oneWordAjax = function (url, word) {
				$.ajax({
				url: url,
				type: 'POST',
				dataType: 'json',
				data: { key : word},
			})
			.done(function(data) {
				return JSON.stringify(data)
				console.log("Sent");
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
		oneWordAjax(url,tag)
	};
}

function ValueSender (location) {
		this.location = location
}

ValueSender.prototype.append = function(value, el, className){
	this.location.append("<"+el+" class="+className+">"+value+"</"+el+">")
}

$(document).ready(function() {
	$(".tag_input").on('keyup', function(event) {
		event.preventDefault();
		var code = event.keyCode || event.which;
		var showDiv = new ValueSender($(".tag_holder"))
 		if(code === 13) {
 			showDiv.append($(this).val(), "div", "tag");
 			oneWordAjax("/tags",$(this).val());
 			$(this).val(" ")
		}
	});
});
