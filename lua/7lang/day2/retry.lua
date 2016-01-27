function retry(count, block)
    for i = 1, count do
        print("Running " .. i)
        local run = coroutine.create(block)
        local succeeded, value = coroutine.resume(run)
        if type(value) ~= "string" then return end
    end
end

math.randomseed( os.time() )

retry( 5,
    function()
        if math.random() > 0.2 then
            coroutine.yield('Something bad happened')
        end
        print('Succeeded')
    end
)
