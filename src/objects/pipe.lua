Pipe = Class{}


function Pipe:init(orientation, y)
    self.x = VIRTUAL_WIDTH
    self.y = y
    self.width = PIPE_WIDTH
    self.height = PIPE_HEIGHT

    self.orientation = orientation
end

function Pipe:update(dt)
end

function Pipe:render()
    love.graphics.draw(gGraphique['pipe'], self.x,
    (self.orientation == 'top' and self.y + PIPE_HEIGHT or self.y),
    0,
    1,
    self.orientation == 'top' and -1 or 1
)
end