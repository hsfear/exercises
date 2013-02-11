var BowlingGame = (function() {
    return function() {
        var my = {
            rolls: []
        };

        var calculateScore = function(frame, rolls) {
            if (rolls.length === 0) return 0;
            if (rolls.length === 1) return rolls[0];
            if (rolls[0] === 10) return sum(rolls.slice(0, 3)) + calculateScore(frame + 1, rolls.slice(1));
            if (rolls[0] + rolls[1] === 10) return sum(rolls.slice(0, 3)) + calculateScore(frame + 1, rolls.slice(2));
            return rolls[0] + rolls[1] + calculateScore(frame + 1, rolls.slice(2));
        }

        var sum = function(numbers) {
            var sum = 0;
            for (var i = 0; i < numbers.length; i++)
                sum += numbers[i];
            return sum;
        }

        this.score = function() { return calculateScore(1, my['rolls']); }
        this.roll = function(roll) { my['rolls'].push(roll); return this; }
    };
})();
                             
module.exports = BowlingGame;