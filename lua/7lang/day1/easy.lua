function ends_in(num)
    return (math.abs(num) % 10) == 3
end
function is_prime(num)
    if num < 2 then
        return false
    else
        return check_prime(num, 2, num - 1)
    end
end
function check_prime(num, start, last)
    if start > last then
        return true
    elseif num % start == 0 then
        return false
    else
        return check_prime(num, start + 1, math.floor(num / start))
    end
end
