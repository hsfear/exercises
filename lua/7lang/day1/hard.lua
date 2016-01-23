function reduce(max, init, f)
    local acc = init
    for i = 1, 5 do
        acc = f(acc, i)
    end
    return acc
end

function fact(n)
    return reduce(n, 1, function(x, y) return x * y end)
end
