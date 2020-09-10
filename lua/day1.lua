local function ends_in_3(num)
    return num % 10 ==3
end

local function is_prime(num)
    for i = 2, num-1 do
        if num % i == 0 then
            return false
        end        
    end
    return true
end

local function first_n_prime_ends_in_3(n)
    local i = 2
    local r = {}
    while true do
        if ends_in_3(i) and is_prime(i) then
            table.insert(r,i)
            if #r == n then
                return table.unpack(r)
            end
        end
        i = i + 1
    end
end

local function for_loop(s, e, f)
    while s <= e do
        f()
        s = s + 1
    end
end

local function reduce_inner(max,init,t,f)
    if init < max then
        return reduce_inner(max,init+1,f(t,init) ,f)
    else
        return f(t,init)
    end
end

local function reduce(max,init,f)
    if init < max then
        return reduce_inner(max,init+2 ,f(init,init+1) ,f)
    else
        return init
    end
end

local function factorial(n)
    return reduce(n,1,function (x,y)
        return x*y
    end)
end
print(first_n_prime_ends_in_3(5))
for_loop(2,6,function ()
    print("hi")
end)
local function add(i,j)
    return i+j
end

print(reduce(5,5,add))
print(factorial(5))