"use strict";

var BinarySearch = require("../../main/BinarySearch.js"),
    should = require('should');

describe('Binary Search', function() {
    it("returns the index of the value in the array", function() {
        new BinarySearch().chop(1, [1]).should.eql(0);
        new BinarySearch().chop(3, [1, 3, 5]).should.eql(1);
        new BinarySearch().chop(1, [1, 3, 5]).should.eql(0);
        new BinarySearch().chop(3, [1, 3, 5]).should.eql(1);
        new BinarySearch().chop(5, [1, 3, 5]).should.eql(2);
        new BinarySearch().chop(1, [1, 3, 5, 7]).should.eql(0);
        new BinarySearch().chop(3, [1, 3, 5, 7]).should.eql(1);
        new BinarySearch().chop(5, [1, 3, 5, 7]).should.eql(2);
        new BinarySearch().chop(7, [1, 3, 5, 7]).should.eql(3);
    });
    it ("returns -1 if the element is not found", function() {
        new BinarySearch().chop(3, [1]).should.eql(-1);
        new BinarySearch().chop(0, [1, 3, 5]).should.eql(-1);
        new BinarySearch().chop(2, [1, 3, 5]).should.eql(-1);
        new BinarySearch().chop(4, [1, 3, 5]).should.eql(-1);
        new BinarySearch().chop(6, [1, 3, 5]).should.eql(-1);
        new BinarySearch().chop(0, [1, 3, 5, 7]).should.eql(-1);
        new BinarySearch().chop(2, [1, 3, 5, 7]).should.eql(-1);
        new BinarySearch().chop(4, [1, 3, 5, 7]).should.eql(-1);
        new BinarySearch().chop(6, [1, 3, 5, 7]).should.eql(-1);
        new BinarySearch().chop(8, [1, 3, 5, 7]).should.eql(-1);
    });
    it ("returns -1 for anyu query if the array has no elements", function() {
        new BinarySearch().chop(1, []).should.eql(-1);
    });
});
