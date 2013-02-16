module.exports = (function() {
    var chopImpl = function(value, array, start, end) {
        if (end - start <= 1)
            return (value === array[start]) ? start :
            (value === array[end]) ? end :
            -1;
        var mid = start + Math.floor((end - start) / 2);
        return (array[mid] > value) ? chopImpl(value, array, start, mid) : chopImpl(value, array, mid, end);
    };

    return function() {
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