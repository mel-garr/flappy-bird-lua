require 'src/Dependencies'

-- local pipePairs = {}
-- local timer = 0
local lastY = -PIPE_HEIGHT + math.random(80) + 20

function love.load()
    love.window.setTitle('flappy')
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
    gSounds['music']:setLooping(true)
    gSounds['music']:play()
    gStateMachine:change('title')
    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.mousepressed(x, y, button)
    love.mouse.buttonsPressed[button] = true
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    love.keyboard.keysPressed[key] = true
end

function love.mouse.wasPressed(button)
    return love.mouse.buttonsPressed[button]
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end



function love.update(dt)
    background_scroll = (background_scroll + background_scroll_speed * dt) % background_looping_point 
    ground_scroll = (ground_scroll + ground_scroll_speed * dt) %VIRTUAL_WIDTH
    gStateMachine:update(dt)
   
    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}

end

function love.draw()
    push:start()
    love.graphics.draw(gGraphique['background'], -background_scroll, 0)
    gStateMachine:render()
    love.graphics.draw(gGraphique['ground'], -ground_scroll, VIRTUAL_HEIGHT - 15)
    push:finish()
end

function displayFPS()
    love.graphics.setFont(gfonts['small'])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' ..tostring(love.timer.getFPS()), 5, 5)
end
