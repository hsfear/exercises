require 'medium'
setmetatable(_G, {
    __newindex = function(table, key, value)
        print("newindex")
        if type(value) == 'table' then
            setmetatable(value, { __add = concatenate })
        end
        rawset(table, key, value)
    end
})
b1 = {"1", "2"}
b2 = {"3", "4"}
result = b1 + b2
print(#result)
print(result[1])
print(result[2])
print(result[3])
print(result[4])
