"use strict";

var BowlingGame = require("../../main/BowlingGame.js"),
    should = require('should');

describe('The Bowling Game', function() {
    it("returns a score of 0 for a new game", function() {
        new BowlingGame().score().should.eql(0);
    });
    it("returns the number of pins knocked down on the first roll if it is not a strike", function() {
        new BowlingGame().roll(5).score().should.eql(5);
    });
    it("returns the number of pins knocked down on the first two rolls if it is not a strike or spare", function() {
        new BowlingGame().roll(5).roll(3).score().should.eql(8);
    });
    it("adds the ball after a spare to a spare", function() {
        new BowlingGame().roll(5).roll(5).roll(3).score().should.eql(16);
    });
    it("adds the two balls after a strike", function() {
        new BowlingGame().roll(10).roll(5).roll(3).score().should.eql(26);
    });
    it("adds the next ball after a strike for an incomplete frame", function() {
        new BowlingGame().roll(10).roll(5).score().should.eql(20);
    });
    it("correctly ends in the 10th frame for a game with no marks", function() {
        var game = new BowlingGame();
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.true;
    });
    it("correctly accounts for strikes", function() {
        var game = new BowlingGame();
        game.roll(10).isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.false;
        game.roll(1).roll().isDone().should.be.true;
    });
    it("correctly accounts for strikes in the 10th frame", function() {
        var game = new BowlingGame();
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(10).isDone().should.be.false;
        game.roll(10).isDone().should.be.false;
        game.roll(10).isDone().should.be.true;
    });
    it("correctly accounts for spares in the 10th frame", function() {
        var game = new BowlingGame();
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(1).roll(1).isDone().should.be.false;
        game.roll(9).roll(1).isDone().should.be.false;
        game.roll(10).isDone().should.be.true;
    });
});
