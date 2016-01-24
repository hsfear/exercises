require 'busted.runner'()
require 'medium'
describe("__add", function()
    local original = getmetatable(_G)

    before_each(function()
        setmetatable(_G, {
            __newindex = function(table, key, value)
                if type(value) == 'table' then
                    setmetatable(value, { __add = concatenate })
                end
                rawset(table, key, value)
            end
        })
    end)

    after_each(function()
        setmetatable(_G, original)
    end)

-- Unfortunately busted replaces the global environment so this test doesn't work
--     it("concatenates 2 arrays", function()
--         b1 = {"1", "2"}
--         b2 = {"3", "4"}
--         result = b1 + b2
--         assert.is_equals(4, #result)
--         assert.is_equals("1", result[1])
--         assert.is_equals("2", result[2])
--         assert.is_equals("3", result[3])
--         assert.is_equals("4", result[4])
--     end)
end)
