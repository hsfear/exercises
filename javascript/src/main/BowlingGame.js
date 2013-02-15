var BowlingGame = (function() {
        var calculateScore = function(score, frame, rolls) {
            if (rolls.length === 0) return score;
            if (rolls.length === 1) return score + rolls[0];
            if (hasStrike(rolls)) return calculateScore(score + sum(rolls.slice(0, 3)), frame + 1, rolls.slice(1));
            if (hasSpare(rolls)) return calculateScore(score + sum(rolls.slice(0, 3)), frame + 1, rolls.slice(2));
            return calculateScore(score + rolls[0] + rolls[1], frame + 1, rolls.slice(2));
        };

        var checkDone = function(frame, rolls) {
            if (rolls.length === 0 || rolls.length === 1) return false;
            if (frame < 10) return checkDone(frame + 1, rolls.slice(hasStrike(rolls) ? 1 : 2));
            return (hasStrike(rolls) || hasSpare(rolls)) ? rolls.length === 3 : rolls.length === 2;
        };

        var hasStrike = function(rolls) { return rolls.length >= 1 && rolls[0] === 10; };

        var hasSpare = function(rolls) { return rolls.length >= 2 && rolls[0] + rolls[1] === 10; };

        var sum = function(numbers) {
            var sum = 0;
            for (var i = 0; i < numbers.length; i++)
                sum += numbers[i];
            return sum;
        };

        var DoneError = function() {};
        DoneError.prototype = new Error();

    return function() {
        return {
            rolls: [],
            score: function() { return calculateScore(0, 1, this.rolls); },
            isDone: function() { return checkDone(1, this.rolls); },
            roll: function(roll) { if (this.isDone()) throw new DoneError(); this.rolls.push(roll); return this; }
        };
    };
})();
                             
module.exports = BowlingGame;