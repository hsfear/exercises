var Widget = Object.create(null);

Widget.init = function(width,height) {
	this.width = width || 50;
	this.height = height || 50;
	this.$elem = null;
};

Widget.render = function($where){
	if (this.$elem) {
		this.$elem.css({
			width: this.width + "px",
			height: this.height + "px"
		}).appendTo($where);
	}
};

var Button = Object.create(Widget);

Button.init = function(width,height,label) {
	// "super" constructor call
	Widget.init.call(this,width,height);
	this.label = label || "Default";

	this.$elem = $("<button>").text(this.label);
};

Button.render = function($where) {
	// "super" call
	Widget.render.call(this,$where);
	this.$elem.click(this.onClick.bind(this));
};

Button.onClick = function(evt) {
	console.log("Button '" + this.label + "' clicked!");
};

$(document).ready(function(){
	var $body = $(document.body);
	var btn1 = Object.create(Button);
	btn1.init(125,30,"Hello");
	var btn2 = Object.create(Button);
	btn2.init(150,40,"World");

	btn1.render($body);
	btn2.render($body);
});
