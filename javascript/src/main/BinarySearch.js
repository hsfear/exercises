module.exports = (function() {
    return function() {
        var chopImpl = function(value, array, start, end) {
            var mid = start + Math.floor((end - start) / 2);
            return (array[mid] === value) ? mid :
                   (start === end) ? -1 :
                   (array[mid] > value) ? chopImpl(value, array, start, (end !== mid) ? mid : start) :
                   chopImpl(value, array, (start !== mid) ? mid : end, end);
        };

        return {
            chop: function(value, array) {
                return (array.length ==  0) ? -1 :
                       (value < array[0]) ? -1 :
                       (value > array[array.length - 1]) ? -1 :
                       chopImpl(value, array, 0, array.length - 1);
            }
        };
    };
})();