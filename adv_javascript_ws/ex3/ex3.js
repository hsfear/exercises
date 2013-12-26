// assume this data came from the database
var notes = [
	"This is the first note I've taken!",
	"Now is the time for all good men to come to the aid of their country.",
	"The quick brown fox jumped over the moon."
];

function addNote(note) {
	$("#notes").prepend(
		$("<a href='#'></a>")
		.addClass("note")
		.text(note)
	);
}

function addCurrentNote() {
	if ($("#note").val()) {
		notes.push($("#note").val());
		addNote($("#note").val());
		$("#note").val("");
	}
}

function showHelp() {
	$("#help").show();
	// TODO: listen for how to close the help box
}

function hideHelp() {
	$("#help").hide();
}

function init() {
	// build the list from the "database"
	for (i=0; i<notes.length; i++) {
		addNote(notes[i]);
	}

	// listen to "help" button
	$("#open_help").bind("click",function(evt){
		if (!$("#help").is(":visible")) {
			showHelp();
		}
	});

	// listen to "add" button
	$("#add_note").bind("click",function(evt){
		addCurrentNote();
	});

	// listen for <enter> in text box
	$("#note").bind("keypress",function(evt){
		if (evt.which == 13) {
			addCurrentNote();
		}
	});

	// listen for clicks outside the notes box
	$(document).bind("click",function(evt){
		$("#notes").removeClass("active");
		$("#notes .note").removeClass("highlighted");
	});

	// listen for clicks to activate border of notes area
	// TODO!

	// listen for clicks on note elements
	// TODO!
}

$(document).ready(init);
