function init(baz,done) {
	var foo = "foo " + baz();

	console.log("foo: " + foo);

	done(foo);
}