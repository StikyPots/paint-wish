local globals = {}
local Cicle = require 'Drawable'
local function Ff(mx, my)
    love.graphics.circle("fill",mx, my, 10)
end


function globals:DrawMenu()
    local ww = love.graphics:getWidth()
    local wh = love.graphics:getHeight()
    local Button_width = ww * (1/2)
    local BUTTON_HEIGHT = 55
    local Margin = 16
    local Total_height = (BUTTON_HEIGHT + Margin) * #MenuButtons
    local Cursor_Y = 0  

    for i, button in ipairs(MenuButtons) do
        local color = {0.77, 0.54, 0.91, 1.0}
        button.last = button.now
        local mx, my = love.mouse.getPosition()
        local bx = (ww * 0.5) - (Button_width * 0.5)
        local by = (wh * 0.5) - (Total_height * 0.5) + Cursor_Y
        local hot = mx > bx and mx < bx + Button_width and
                    my > by and my < by + BUTTON_HEIGHT
         if hot then
            color = {0.8, 0.8, 0.9 , 1.0}
        end
        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot then
                button.func()
        end
        love.graphics.setColor(unpack(color))
        love.graphics.rectangle(
            "fill",
            bx,
             by,
            Button_width,
            BUTTON_HEIGHT
            )
        local TextHeight, TextWidth = Font:getHeight(button.text), Font:getWidth(button.text)
    
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.print(
                button.text,
                Font,
                (ww * 0.5) - TextWidth * 0.5,
                by + (TextHeight * 0.1)
            )
        Cursor_Y = Cursor_Y + (BUTTON_HEIGHT + Margin)
     end
end

function globals:GameButtonAll()
    local ww = love.graphics:getWidth()
    local wh = love.graphics:getHeight()
    local Button_width = ww * (1/10)
    local BUTTON_HEIGHT = 64
    local Margin = 10
    local Total_height = (BUTTON_HEIGHT + Margin) * #MenuButtons
    local Cursor_Y = 0

    for i, button in ipairs(GameButtons) do
        local color = {0.77, 0.54, 0.91, 1.0}
        button.last = button.now
        local mx, my = love.mouse.getPosition()
        local bx = (ww * 0.005) - (Button_width * 0.005)
        local by = (wh * 0.5) - (Total_height * 0.5) + Cursor_Y
        local hot = mx > bx and mx < bx + Button_width and
                    my > by and my < by + BUTTON_HEIGHT
         if hot then
            color = {0.8, 0.8, 0.9 , 1.0}
        end
        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot then
                button.func()
        end

        if button.Color == "Red" then
            color = {1, 0, 0}
        elseif button.Color == "Blue" then
            color = {0,	0, 1}
        elseif button.Color == "Violet" then
            color = {0.77, 0.54, 0.91, 1.0}
        end
        love.graphics.setColor(unpack(color))
        love.graphics.rectangle(
            "fill",
            bx,
             by,
            Button_width,
            BUTTON_HEIGHT
            )
        Cursor_Y = Cursor_Y + (BUTTON_HEIGHT + Margin)
     end

end


function globals:DrawTheDraw()
    local mx, my = love.mouse.getPosition()
    if game_satus == 1  and SelectedForme == 1 then
        if love.mouse.isDown(1) then
        if selectedColor == 1 then
            table.insert(DrawTable, Cicle(mx, my, "Red"))
            elseif selectedColor == 2 then
            table.insert(DrawTable, Cicle(mx, my, "Violet"))
        elseif selectedColor == 3 then
            table.insert(DrawTable, Cicle(mx, my, "Blue"))
        end
     end
end
if game_satus == 1  and SelectedForme == 2 then
    if love.mouse.isDown(1) then
    if selectedColor == 1 then
        table.insert(DrawRect, Cicle(mx, my, "Red"))
        elseif selectedColor == 2 then
        table.insert(DrawRect, Cicle(mx, my, "Violet"))
    elseif selectedColor == 3 then
        table.insert(DrawRect, Cicle(mx, my, "Blue"))
    end
 end

end
    for i, Circle in ipairs(DrawTable) do
        Color = {1, 0, 0}
        if Circle.Color == 'Red' then
            Color = {1, 0, 0}
        elseif Circle.Color == "Blue" then
            Color = {0,	0, 1}
        elseif Circle.Color == "Violet" then
            Color = {0.77, 0.54, 0.91, 1.0}
        end
        love.graphics.setColor(unpack(Color))
        love.graphics.circle("fill", Circle.x, Circle.y, 10)
    end

    for i, Circle in ipairs(DrawRect) do
        Color = {1, 0, 0}
        if Circle.Color == 'Red' then
            Color = {1, 0, 0}
        elseif Circle.Color == "Blue" then
            Color = {0,	0, 1}
        elseif Circle.Color == "Violet" then
            Color = {0.77, 0.54, 0.91, 1.0}
        end
        love.graphics.setColor(unpack(Color))
        love.graphics.rectangle("fill",Circle.x , Circle.y, 25, 25)
    end
end

return globals