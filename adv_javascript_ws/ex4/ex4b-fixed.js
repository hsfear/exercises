(function(init){

	var obj = {
		bam: "bam!"
	};

	init(baz.bind(obj),/*done=*/function(foo){
		var bar = foo + " bar";

		console.log("bar: " + bar);
	});

	function baz() {
		return this.bam;
	}

})(init);