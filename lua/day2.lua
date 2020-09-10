local function table_to_string(t)
    local result = {}
    for k, v in pairs(t) do
        -- table.insert(result, k .. ":" .. v)
        table.insert(result, k)
    end
    return table.concat(result, "\n")
end

local mt = {
    __tostring = table_to_string,
    -- 当且仅当找不到k的时候，才会被调用
    __index = function(t, k)
        print("You are read " .. k)
    end,
    -- 同上
    __newindex = function(t, k, v)
        print(t)
        print(k);
        print(v)
        local fsfawe = t[k]
        print(fsfawe)
        -- print("You are wirte " .. v .. " to override  ".. t[k])
    end
}

local x = {
    name = "xuguofan",
    age = 27,
    address = "unknown"
}

setmetatable(x, mt)

Villain = {
    health = 100,
    new = function(self, name)
        local obj = {
            name = name,
            health = self.health
        }
        setmetatable(obj, self)
        self.__index = self
        self.__tostring = table_to_string
        return obj
    end,
    take_hit = function(self)
        self.health = self.health - 10
    end
}

local dietrich = Villain.new(Villain, "Dietrich")
dietrich:take_hit()
-- print(dietrich.health)
-- local fff = getmetatable(dietrich)
-- setmetatable(fff,mt)
-- dietrich.__tostring = table_to_string
-- print(dietrich)

local function fibonacci()
    local m = 1
    local n = 1
    while true do
        coroutine.yield(m)
        m, n = n, m + n
    end
end
-- local generator = coroutine.create(fibonacci)
-- local succeeded, value = coroutine.resume(generator)
-- print(value)
-- succeeded, value = coroutine.resume(generator)
-- print(value)
-- succeeded, value = coroutine.resume(generator)
-- print(value)

local scheduler = require 'scheduler'

local function punch()
    for i = 1, 5 do
        print("punch " .. i)
        scheduler.wait(1.0)
    end
end

local function block()
    for i = 1, 3 do
        print("block " .. i)
        scheduler.wait(2.0)
    end
end
SB = 1

-- scheduler.schedule(0.0,coroutine.create(punch))
-- scheduler.schedule(0.0,coroutine.create(block))
-- scheduler.run()

-- setmetatable(_G, mt)
-- print(_G)

local function concatenate(a1, a2)
    local result = {}
    for key, value in pairs(a1) do
        table.insert(result, value)
    end
    for key, value in pairs(a2) do
        table.insert(result, value)
    end
    return result
end

-- local t = concatenate({6, 5, 4}, {1, 2, 3})
-- print(table.unpack(t))

Queue = {
    items = {},

    new = function(self)
        local result = {}
        setmetatable(result, self)
        self.__index = self
        return result
    end,

    add = function(self, item)
        self.items[#self.items + 1] = item
    end,

    remove = function(self)
        local result = self.items[1]
        for i = 1, #self.items - 1 do
            self.items[i] = self.items[i + 1]
        end
        self.items[#self.items] = nil
        return result
    end
}

-- local q = Queue:new()
-- q:add(1)
-- q:add(2)
-- q:add(3)
-- print(q:remove())
-- print(q:remove())
-- print(q:remove())
-- print(q:remove())
-- print(q:remove())

local function retry(count, body)
    local thread = coroutine.create(body)
    local _,value = coroutine.resume(thread)
    if value ~= nil then
        if count > 0 then
            retry(count - 1, body)
        else
            print("executed limit")
        end
    else
    end
end

retry(5, function()
    if math.random() > 0.2 then
        coroutine.yield('Something happend')
    end
    print('Succeeded')
end)
