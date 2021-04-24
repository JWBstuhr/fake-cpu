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
        c = 7
    },
    s6 = {
        m = "Experiments Done: Fetching..",
        c = 7
    },
    s7 = {
        m = "Successes: Waiting..",
        c = 7
    },
    s8 = {
        m = "AI Programming: Connecting..",
        c = 7
    },
    s9 = {
        m = "Program APIs: Connecting..",
        c = 7
    },
    s10 = {
        m = "Available Funds: Checking..",
        c = 7
    },
    s11 = {
        m = "Tardises Made: Checking..",
        c = 7
    }
}
local function refreshStat()
    term.clear()
    term.setCursorPos(1,1)
    printCentered(1,stat.s1.m,stat.s1.c)
    printCentered(2,stat.s2.m,stat.s2.c)
    printCentered(3,stat.s3.m,stat.s3.c)
    printCentered(4,stat.s4.m,stat.s4.c)
    printCentered(5,stat.s5.m,stat.s5.c)
    printCentered(6,stat.s6.m,stat.s6.c)
    printCentered(7,stat.s7.m,stat.s7.c)
    printCentered(8,stat.s8.m,stat.s8.c)
    printCentered(9,stat.s9.m,stat.s9.c)
    printCentered(10,stat.s10.m,stat.s10.c)
    printCentered(11,stat.s11.m,stat.s11.c)
end
refreshStat()