function concatenate(a1, a2)
    local result = { }
    for i = 1, #a1 do
        result[#result + 1] = a1[i]
    end
    for i = 1, #a2 do
        result[#result + 1] = a2[i]
    end
    return result
end
