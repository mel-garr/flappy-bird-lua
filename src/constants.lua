
-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

background_scroll = 0
ground_scroll = 0
background_scroll_speed = 30
ground_scroll_speed = 60
background_looping_point = 413

GRAVITY = 20

gfonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/flappy.ttf', 14),
    ['flappy'] = love.graphics.newFont('fonts/flappy.ttf', 28),
    ['huge'] = love.graphics.newFont('fonts/flappy.ttf', 56)
}

gSounds = {
    ['jump'] = love.audio.newSource('sounds/jump.wav', 'static'),
    ['explosion'] = love.audio.newSource('sounds/explosion.wav', 'static'),
    ['hurt'] = love.audio.newSource('sounds/hurt.wav', 'static'),
    ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
    ['music'] = love.audio.newSource('sounds/marios_way.mp3', 'static')
}

gStateMachine = StateMachine{
    ['title'] = function() return TitleScreenState() end,
    ['countdown'] = function() return countdownState() end,
    ['play'] = function() return PlayState() end,
    ['score'] = function() return ScoreState() end
}

gGraphique = {
    ['background'] = love.graphics.newImage('graphics/background.png'),
    ['bird'] = love.graphics.newImage('graphics/bird.png'),
    ['ground'] = love.graphics.newImage('graphics/ground.png'),
    ['pipe'] = love.graphics.newImage('graphics/pipe.png')
}