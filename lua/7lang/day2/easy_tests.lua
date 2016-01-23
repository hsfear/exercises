require 'busted.runner'()
require 'easy'
require 'strict'
describe("concetenate", function()
    it("concatenates 2 arrays", function()
        local result = concatenate({"1", "2"}, {"3", "4"})
        assert.is_equals(4, #result)
        assert.is_equals("1", result[1])
        assert.is_equals("2", result[2])
        assert.is_equals("3", result[3])
        assert.is_equals("4", result[4])
    end)
end)

describe("strict changes", function()
    function tablelength(T)
        local count = 0
        for _ in pairs(T) do count = count + 1 end
        return count
    end
    it("deletes an index if nil is passed as the value", function()
        local map = {
            key = "value"
        }
        assert.is_equals(1, tablelength(map))
        map.key = nil
        assert.is_equals(0, tablelength(map))
    end)
end)
