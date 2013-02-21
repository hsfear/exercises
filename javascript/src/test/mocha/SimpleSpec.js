var Simple = require("../../main/Simple.js")
  , should = require('should');

describe('Simple javascript exercises', function() {
    describe("max testfs", function() {
        it("should return the max of two mumbers", function() {
            Simple.max(2, 10).should.eql(10);
            Simple.max(12, 5).should.eql(12);
        });
        
        it("should return the max of a list of numbers", function() {
            Simple.max(1, 2, 3, 4, 5, 6, 7, 8, 9, 10).should.eql(10);
            Simple.max(12, 2, 3, 4, 5, 6, 7, 8, 9, 10).should.eql(12);
        });
        
        it("should throw an exception if you don't provide enough arguments", function() {
            (function() { Simple.max()}).should.throw('Argument Required');
        });
        
        it("should throw an exception if one of the arguments is not a number", function() {
            (function() { Simple.max(1, "a", 3)}).should.throw('Invalid Argument');
        });
    });
    
    describe("isVowel", function() {
        it("should check wehether the argument is a vowel", function() {
            Simple.isVowel("a").should.eql(true);
            Simple.isVowel("b").should.eql(false);
        });
        
        it("should throw an exception if the string is longer than a single character", function() {
            (function() { Simple.isVowel(""); }).should.throw('Invalid Argument');
            (function() { Simple.isVowel("ab"); }).should.throw('Invalid Argument');
        });
        
        it("should require a parameter", function() {
            (function() { Simple.isVowel(); }).should.throw('Argument Required');
        });
    });

    describe("translate", function() {
        it("should double every consonant and put an 'o' in between", function() {
            Simple.translate("bcdfghjklmnpqrstvwxyz").should.eql("bobcocdodfofgoghohjojkoklolmomnonpopqoqrorsostotvovwowxoxyoyzoz");
        });
        it("should not double any vowel", function() {
            Simple.translate("aeiou").should.eql("aeiou");
        });
    });

    describe("count words", function() {
       it("should count a single word", function() {
           Simple.countWords("hello").should.eql(1);
       });
    });
});
