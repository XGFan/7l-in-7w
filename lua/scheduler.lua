local pending = {}

local function sort_by_time(t)
    table.sort(t, function(e1, e2)
        return e1.time < e2.time
    end)
end

--将任务放入等待队列，并对队列进行排序，action是一个闭包
local function schedule(time, action)
    pending[#pending + 1] = {
        time = time,
        action = action
    }
    sort_by_time(pending)
end

--让出线程，返回值为等待时间
local function wait(seconds)
    coroutine.yield(seconds)
end

--删除第一个元素，实际上是把最后一个挪到第一个，然后删掉最后一个，也就是说，删除之后，顺序就乱了
local function remove_first(array)
    local result = array[1]
    array[1] = array[#array]
    array[#array] = nil
    return result
end

local function run()
    while #pending > 0 do
        while os.clock() < pending[1].time do

        end
        local item = remove_first(pending) --取出第一个
        local _, seconds = coroutine.resume(item.action)
        if seconds then
            local later = os.clock() + seconds
            schedule(later, item.action)
        end
    end
end

return {
    schedule = schedule,
    run = run,
    wait = wait
}
    