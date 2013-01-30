exports.max = function() {
    if (arguments.length === 0) throw new Error('Argument Required');
    
    var max = arguments[0];
    for (i = 0; i < arguments.length; i++) {
        if (typeof arguments[i] !== 'number') throw new TypeError("Invalid Argument");
        if (arguments[i] > max)
            max = arguments[i];
    }
    return max;
};

exports.isVowel = function(character) {
    if (arguments.length === 0) throw new Error('Argument Required');
    if (character.length !== 1) throw new Error("Invalid Argument");
    return /[aeiou]/.test(character);
};