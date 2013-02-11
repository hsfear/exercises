var Simple = require("../Simple.js");

describe('Simple javascript exercises', function() {
    describe("max testfs", function() {
        it("should return the max of two mumbers", function() {
            expect(Simple.max(2, 10)).toBe(10);
            expect(Simple.max(12, 5)).toBe(12);
        });
        
        it("should return the max of a list of numbers", function() {
            expect(Simple.max(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)).toBe(10);
            expect(Simple.max(12, 2, 3, 4, 5, 6, 7, 8, 9, 10)).toBe(12);
        });
        
        it("should throw an exception if you don't provide enough arguments", function() {
            expect(Simple.max(1)).toBe(1);
            expect(function() { Simple.max(); }).toThrow('Argument Required');
        });
        
        it("should throw an exception if one of the arguments is not a number", function() {
            expect(function() { Simple.max(1, "a", 3); }).toThrow('Invalid Argument');
        });
    });
    
    describe("isVowel", function() {
        it("should check wehether the argument is a vowel", function() {
            expect(Simple.isVowel("a")).toBe(true);
            expect(Simple.isVowel("b")).toBe(false);
        });
        
        it("should throw an exception if the string is longer than a single character", function() {
            expect(function() { Simple.isVowel(""); }).toThrow('Invalid Argument');
            expect(function() { Simple.isVowel("ab"); }).toThrow('Invalid Argument');
        });
        
        it("should require a parameter", function() {
            expect(function() { Simple.isVowel(); }).toThrow('Argument Required');
        });
    });

    describe("translate", function() {
        it("should double every consonant and put an 'o' in between", function() {
            expect(Simple.translate("bcdfghjklmnpqrstvwxyz")).toBe("bobcocdodfofgoghohjojkoklolmomnonpopqoqrorsostotvovwowxoxyoyzoz");
        });
        it("should not double any vowel", function() {
            expect(Simple.translate("aeiou")).toBe("aeiou");
        });
    });

    describe("count words", function() {
       it("should count a single word", function() {
           expect(Simple.countWords("hello")).toBe(1);
       });
    });
});