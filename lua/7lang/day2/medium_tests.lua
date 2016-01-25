require 'busted.runner'()
require 'medium'
require 'queue'
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

describe("Queue", function() 
    local q

    before_each(function() 
        q = Queue:new()
    end)

    it("initially has no elements", function() 
        assert.is_equals(0, q:size())
    end)
    describe("pop", function()
        it("retuns nil if queue is empty", function()
            assert.is_nil(q:pop())
        end)
        it("removes and returns the front eleent of the queue", function()
            q:push(1)
            assert.is_equals(1, q:pop())
            assert.is_equals(0, q:size())
        end)
    end)
    describe("push", function()
        it("adds an element to the back of and empty queue", function()
            q:push(1)
            assert.is_equals(1, q:size())
            assert.is_equals(1, q:pop())
        end)
    end)

    it("handles a sequence of push and pop operations", function()
        q:push(1)
        q:push(2)
        q:push(3)
        assert.is_equals(3, q:size())
        assert.is_equals(1, q:pop())
        assert.is_equals(2, q:size())
        assert.is_equals(2, q:pop())
        assert.is_equals(1, q:size())
        assert.is_equals(3, q:pop())
        assert.is_equals(0, q:size())
    end)
end)
