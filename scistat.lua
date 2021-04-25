local d2clist = {
    c1 = colors.white,
    c2 = colors.gray,
    c3 = colors.lightGray,
    c4 = colors.black,
    c5 = colors.red,
    c6 = colors.orange,
    c7 = colors.yellow,
    c8 = colors.lime,
    c9 = colors.green,
    c10 = colors.lightBlue,
    c11 = colors.cyan,
    c12 = colors.blue,
    c13 = colors.pink,
    c14 = colors.magenta,
    c15 = colors.purple,
    c16 = colors.brown
}
local function d2c(digit)
    local tocolorc = "c" .. digit
    local tocolor = d2clist[tocolorc]
    return tocolor
end
local w,h = term.getSize()
local function printCentered(y,s,c)
    local x = math.floor((w - string.len(s)) /2)
    term.setCursorPos(x,y)
    term.clearLine()
    term.setTextColor(d2c(c))
    term.write(s)
end
local function printColor(y,s,c)
    term.setCursorPos(1,y)
    term.clearLine()
    term.setTextColor(d2c(c))
    term.write(s)
end
local stat = {
    s1 = {
        m = "Internet Status: Connecting..",
        c = 7
    },
    s2 = {
        m = "Ping: Connecting..",
        c = 7
    },
    s3 = {
        m = "Database Status: Connecting..",
        c = 7
    },
    s4 = {
        m = "Core Status: Fetching..",
        c = 7
    },
    s5 = {
        m = "Core Temperature: Waiting..",
        c = 7,
        t = 572
    },
    s6 = {
        m = "Experiments Done: Fetching..",
        c = 7,
        t = 0
    },
    s7 = {
        m = "Successes: Waiting..",
        c = 7,
        t = 0
    },
    s8 = {
        m = "AI Programming: Connecting..",
        c = 7,
        t = 0
    },
    s9 = {
        m = "Program APIs: Connecting..",
        c = 7,
        t = 0
    },
    s10 = {
        m = "Available Funds: Checking..",
        c = 7,
        t = 0
    },
    s11 = {
        m = "Tardises Made: Checking..",
        c = 7,
        t = 0
    }
}
local function refreshStat()
    while true do
        printColor(1,stat.s1.m,stat.s1.c)
        printColor(2,stat.s2.m,stat.s2.c)
        printColor(3,stat.s3.m,stat.s3.c)
        printColor(4,stat.s4.m,stat.s4.c)
        printColor(5,stat.s5.m,stat.s5.c)
        printColor(6,stat.s6.m,stat.s6.c)
        printColor(7,stat.s7.m,stat.s7.c)
        printColor(8,stat.s8.m,stat.s8.c)
        printColor(9,stat.s9.m,stat.s9.c)
        printColor(10,stat.s10.m,stat.s10.c)
        printColor(11,stat.s11.m,stat.s11.c)
        sleep(1)
    end
end
local function s1c()
    while true do
        sleep(math.random(1,5))
        if math.random(1,20) == 5 then
            stat.s1.m = "Internet Status: Disconnected"
            stat.s1.c = 5
        else
            stat.s1.m = "Internet Status: Connected"
            stat.s1.c = 9
        end
    end
end
local function s2c()
    while true do
        if stat.s1.c ~= 7 then
            if stat.s1.c == 5 then
                stat.s2.m = "Ping: 50ms"
                stat.s2.c = 5
                sleep(1)
            else
                sleep(math.random(1,2))
                if math.random(1,3) == 2 then
                    if math.random(1,2) == 1 then
                        if math.random(1,5) == 1 then
                            stat.s2.m = "Ping: " .. math.random(36,49) .. "ms"
                            stat.s2.c = 5
                        else
                            stat.s2.m = "Ping: " .. math.random(26,35) .. "ms"
                            stat.s2.c = 7
                        end 
                    else
                        stat.s2.m = "Ping: " .. math.random(2,25) .. "ms"
                        stat.s2.c = 8
                    end
                end
            end
        else
            sleep(1)
        end
    end
end
local function s3c()
    while true do
        sleep(math.random(1,5))
        if math.random(1,15) == 5 then
            stat.s3.m = "Database Status: Offline"
            stat.s3.c = 5
        else
            stat.s3.m = "Database Status: Online"
            stat.s3.c = 9
        end
    end
end
local function s4c()
    while true do
        if stat.s5.t > 599 then
            stat.s4.m = "Core Status: Overheating!"
            stat.s4.c = 5
        elseif stat.s5.t < 551 then
            stat.s4.m = "Core Status: Overfreezing!"
            stat.s4.c = 12
        else
            stat.s4.m = "Core Status: Online"
            stat.s4.c = 9
        end
        sleep(1)
    end
end
local function s5c()
    while true do
        sleep(math.random(1,3))
        if math.random(1,3) == 2 then
            if math.random(1,25) == 1 then
                if math.random(1,2) == 1 then
                    stat.s5.t = math.random(600,625)
                    stat.s5.m = "Core Temperature: " .. stat.s5.t
                    stat.s5.c = 5
                else
                    stat.s5.t = math.random(525,550)
                    stat.s5.m = "Core Temperature: " .. stat.s5.t
                    stat.s5.c = 12
                end 
            else
                if math.random(1,2) == 1 then
                    stat.s5.t = math.random(572,599)
                    stat.s5.m = "Core Temperature: " .. stat.s5.t
                    stat.s5.c = 6
                else
                    stat.s5.t = math.random(551,571)
                    stat.s5.m = "Core Temperature: " .. stat.s5.t
                    stat.s5.c = 10
                end 
            end
        end
    end
end
local function s6c()
    while true do
        sleep(math.random(1,3))
        if stat.s6.t > 99999999999 then
            stat.s6.t = 0
            stat.s6.m = "Experiments Done: " .. stat.s6.t
            stat.s6.c = 1
            stat.s7.t = 0
            stat.s7.m = "Successes: " .. stat.s7.t
            stat.s7.c = 1
        else
            stat.s6.t = stat.s6.t + math.random(1,5)
            stat.s6.m = "Experiments Done: " .. stat.s6.t
            stat.s6.c = 1
            if math.random(1,3) ~= 2 then
                stat.s7.t = stat.s7.t + math.random(1,3)
                stat.s7.m = "Successes: " .. stat.s7.t
                stat.s7.c = 1
            end
        end
    end
end
local function s8c()
    while true do
        sleep(math.random(1,5))
        if stat.s8.t > 0 and math.random(1,2) == 1 or stat.s8.t > 99 then
            stat.s8.t = stat.s8.t + math.random(-5,-1)
            stat.s8.m = "AI Programming: " .. stat.s8.t .. "%"
            stat.s8.c = 5
        else
            stat.s8.t = stat.s8.t + math.random(1,5)
            stat.s8.m = "AI Programming: " .. stat.s8.t .. "%"
            stat.s8.c = 8
        end
    end
end
local function s9c()
    while true do
        sleep(math.random(1,3))
        if stat.s9.t > 999999999999999 then
            stat.s9.t = 0
            stat.s9.m = "Program APIs: " .. stat.s9.t
            stat.s9.c = 1
        else
            stat.s9.t = stat.s9.t + math.random(1,5)
            stat.s9.m = "Program APIs: " .. stat.s9.t
            stat.s9.c = 1
        end
    end
end
local function s10c()
    while true do
        sleep(math.random(1,5))
        if stat.s10.t > 99999999999 then
            stat.s10.t = 0
            stat.s10.m = "Available Funds: $" .. stat.s10.t
            stat.s10.c = 8
        end
        if math.random(1,3) == 2 then
            stat.s10.t = stat.s10.t + math.random(-5,-1)
            stat.s10.c = 5
            stat.s10.m = "Available Funds: $" .. stat.s10.t
        else
            stat.s10.t = stat.s10.t + math.random(1,10)
            stat.s10.c = 8
            stat.s10.m = "Available Funds: $" .. stat.s10.t
        end
    end
end
local function s11c()
    while true do
        sleep(math.random(1,7))
        if stat.s11.t > 99999999999999 then
            stat.s11.t = 0
            stat.s11.m = "Tardises Made: " .. stat.s11.t
            stat.s11.c = 1
        else
            stat.s11.t = stat.s11.t + 1
            stat.s11.m = "Tardises Made: " .. stat.s11.t
            stat.s11.c = 1
        end
    end
end
term.clear()
term.setCursorPos(1,1)
local ok, error = pcall(parallel.waitForAny(refreshStat,s1c,s2c,s3c,s4c,s5c,s6c,s8c,s9c,s10c,s11c))
