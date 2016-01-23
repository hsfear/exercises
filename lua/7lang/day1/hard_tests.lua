require 'busted.runner'()
require 'hard'
describe("reduce", function()
    function add(previous, next)
        return previous + next
    end

    it("calls f max times aggregating results at it goes", function()
        assert.is_equal(15, reduce(5, 0, add))
    end)
end)

describe("fact", function()
    it("returns 120 at the fact of 5", function()
        assert.is_equal(120, fact(5))
    end)
end)
