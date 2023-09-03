local Button = require 'Module.Buttons'
local globals = require 'global'








MenuButtons = {}
GameButtons = {}
DrawTable = {}
DrawRect = {}
--[game_satus = 1 in game, game_satus = 2 in menu, selectedColor = 3]--
game_satus =  2
selectedColor = 1 --1 = rouge 2 = violet 3 = bleu
drawable = false
Full = false
SelectedForme = 1 

local function Remove()
    for i, cicle in ipairs(DrawTable) do
        table.remove(DrawTable, i)
    end
    for i, cicle in ipairs(DrawRect) do
        table.remove(DrawRect, i)
    end
end






function love.load()
    Font = love.graphics.newFont(35)
    table.insert(MenuButtons, Button("Play", function()love.timer.sleep(0.1) game_satus = 1 end))
    table.insert(MenuButtons, Button("Windows", function() Full = true end))
    table.insert(MenuButtons, Button("See you", function() love.event.quit() end))

    table.insert(GameButtons, Button("", function ()selectedColor = 2 end, "Violet"))
    table.insert(GameButtons, Button("", function() selectedColor = 3 end, "Blue"))
    table.insert(GameButtons, Button("",function () selectedColor = 1 end, "Red"))

    PosX = 0
    PosY = 0
end
function love.update(dt)
    if love.keyboard.isDown("escape") then
        game_satus = 2
    end
    if love.keyboard.isDown("return") then
        Remove()
    end
    if Full then
        love.window.setFullscreen(true)
    end
    if love.keyboard.isDown("1") then
        SelectedForme = 1
    end
    if love.keyboard.isDown("2") then
        SelectedForme = 2
    end
    if love.mouse.isDown(2) then
       local x, y = love.mouse:getPosition()
       for i, Rem in ipairs(DrawTable) do
            if math.sqrt((Rem.x-x)^2 + (Rem.y-y)^2) <= 10 then
            table.remove(DrawTable, i)
            end
        end
        for i, Rem in ipairs(DrawRect) do
            if x >= Rem.x and x <= Rem.x + 25 and y >= Rem.y and y <= Rem.y + 25 then
            table.remove(DrawRect, i)
            end
        end
    end
end

function love.draw()
    local Font = love.graphics.newFont(35)
    if game_satus == 2 then
        globals:DrawMenu()
        love.graphics.setBackgroundColor(0, 0, 0)
        elseif game_satus == 1 then
            globals:GameButtonAll()
            globals:DrawTheDraw()
            love.graphics.setBackgroundColor(1, 1, 1)
     end
     love.graphics.print("1 : Circle 2 : Rectangle 25X25",10, 10)
end


local bank = require 'Test'


Jules = bank:New({money = 10000})


Jules:withdraw(200)

Lionel = bank:New({money = 10})
Lionel:deposit(300)


print(Jules.money)
print(Lionel.money)