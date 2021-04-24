local d2clist = {
    c1 = colors.gray,
    c2 = colors.lime,
    c3 = colors.green,
    c4 = colors.lime,
    c5 = colors.green,
    c6 = colors.green
}
local function d2c(digit)
    local tocolorc = "c" .. digit
    local tocolor = d2clist[tocolorc]
    return tocolor
end
local function printColor(s,c,y)
    term.setCursorPos(oldx + 1,y)
    term.setTextColor(colors.black)
    term.write("  ")
    term.setCursorPos(oldx,y)
    term.setTextColor(d2c(c))
    term.write(s)
end
tempy = 1
tempx = 1
decy = 1
while true do
    oldx, oldy = term.getCursorPos()
    printColor(math.random(0,1),math.random(1,6),decy)
    if tempy > 29 then
        tempy = 1
        term.setCursorPos(1,decy)
        decy = decy + 1
        if tempx > 12 then
            tempx = 1
            tempy = 1
            decy = 1
            term.setCursorPos(1,1)
        else
            tempx = tempx + 1
        end
    else
        tempy = tempy + 1
    end
    
    sleep(0.05)
end