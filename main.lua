
logic = require("logic")


function love.keypressed(key, dt)
    if(key == "escape") then
        love.event.quit()
    end
    if(key == "w") then
        up()
    elseif (key == "d") then
        right()
    elseif (key == "a") then
        left()
    elseif (key == "s") then
        down()
    elseif(key == "b") then
        spawnTiles()
    else
        print("Invalid input")
    end
    spawnTiles()
end


function love.load()
    -- SET THE NAME AND ICON
    love.window.setTitle("2048")
    icon = love.image.newImageData("Tiles/2048.png")
    love.window.setIcon(icon)

    -- WIDTH AND HEIGHT OF THE WINDOW
    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()

    -- SPLIT THE WINDOW INTO 4 COLUMNS AND 4 ROWS
    COL_1 = WIDTH/4
    COL_2 = WIDTH/4 + 100
    COL_3 = WIDTH/4 + 200
    COL_4 = WIDTH/4 + 300

    COLUMNS = {COL_1, COL_2, COL_3, COL_4}

    ROW_1 = HEIGHT/4
    ROW_2 = HEIGHT/2 - 50
    ROW_3 = HEIGHT/2 + 50
    ROW_4 = HEIGHT/2 + 150

    ROWS = {ROW_1, ROW_2, ROW_3, ROW_4}

    TILE_DIMENSIONS = 100 -- 100x100


    -- LOAD THE GRID
    gridRow_1 = {2, 0, 0, 0}
    gridRow_2 = {0, 4, 0, 0}
    gridRow_3 = {0, 0, 0, 2}
    gridRow_4= {0, 2, 0, 0}

    GRID = {gridRow_1, gridRow_2, gridRow_3, gridRow_4}

    -- lOAD THE CARDS
    tiles = {}
    font = love.graphics.newFont(20)

    -- PLAY SOME MUSIC
    music = love.audio.newSource("Music/crazySong.mp3", "stream")
    music:setVolume(0.2)
    music:setLooping(true)
    love.audio.play(music)
    musicBTN = {x = 40, y = 300, w = 5, h = 5}

    i = 2
    while i < 8193 do
        tiles[tostring(i)] = love.graphics.newImage("Tiles/" .. i .. ".png")
        i = i * 2
    end
end

local isDragging = false
local offsetX, offsetY

function love.update(dt)
    local mouseX, mouseY = love.mouse.getPosition()

    if love.mouse.isDown(1) then -- 1 represents the left mouse button
        if isPointInCircle(mouseX, mouseY, musicBTN.x, musicBTN.y, musicBTN.w) then
            isDragging = true
            offsetX = mouseX - musicBTN.x
            offsetY = mouseY - musicBTN.y
        end
    else
        isDragging = false
    end

    if isDragging then
        musicBTN.y =  math.min(math.max(mouseY - offsetY, 250), 350)
        local normalizedValue = 1 - (musicBTN.y - 250) / (350 - 250)
        music:setVolume(normalizedValue)
    end
end

function isPointInCircle(px, py, cx, cy, radius)
    local distanceSquared = (px - cx)^2 + (py - cy)^2
    return distanceSquared <= radius^2
end

function love.draw()
    love.graphics.setFont(font)
    love.graphics.print("Score: " ..getSum(), 40, 40)
    for row = 1 , 4 do
        for col = 1 , 4 do
            if GRID[row][col] ~= 0 then
                love.graphics.draw(tiles[tostring(GRID[row][col])], COLUMNS[col], ROWS[row])
            end
        end
    end
    love.graphics.line(40, 250, 40, 350)
    love.graphics.circle("fill", musicBTN.x, musicBTN.y, musicBTN.w)
end