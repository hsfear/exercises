function for_loop(start,last,call)
    local next = start
    while next <= last do
        call()
        next = next + 1
    end
end
