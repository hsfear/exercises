exports.max = function() {
    if (arguments.length === 0) throw new Error('Argument Required');
    
    var max = arguments[0];
    Array.prototype.slice.call(arguments).forEach(function(argument) {
        if (typeof argument !== 'number') throw new TypeError("Invalid Argument");
        max = (argument > max) ? argument : max;
    });
    return max;
};

exports.isVowel = function(character) {
    if (arguments.length === 0) throw new Error('Argument Required');
    if (character.length !== 1) throw new Error("Invalid Argument");
    return /[aeiou]/.test(character);
};

exports.translate = function(string) {
    return string.replace(/[bcdfghjklmnpqrstvwxyz]/gi, "$&o$&");
};

exports.countWords = function(string) {
    return string.split(/\W+/).length;
};
