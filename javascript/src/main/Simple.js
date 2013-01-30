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
    return /[aeiou]/.test(character);
};