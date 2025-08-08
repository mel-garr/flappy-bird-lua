require 'src/Dependencies'

function love.load()
    love.window.setTitle('flappy')
    love.graphics.setDefaultFilter('nearest', 'nearest')
    math.randomseed(os.time())
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
    love.keyboard.keysPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    displayFPS()
    push:finish()
end

function displayFPS()

    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' ..tostring(love.timer.getFPS()), 5, 5)
end
