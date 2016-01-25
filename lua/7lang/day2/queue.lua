Queue = {
    front = 1,
    back = 1,
    size = function(self) return self.back - self.front end,
    empty = function(self) return self:size() == 0 end,
    pop = function(self)
        if self:empty() then
            return nil
        else
            local result = self[self.front]
            self[self.front] = nil
            self.front = self.front + 1
            return result
        end
    end,
    push = function(self, value)
        self[self.back] = value
        self.back = self.back + 1
    end
}

function Queue:new ()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end
