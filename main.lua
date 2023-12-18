
logic = require("logic")


function love.keypressed(key)
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

    i = 2
    while i < 8193 do
        tiles[tostring(i)] = love.graphics.newImage("Tiles/" .. i .. ".png")
        i = i * 2
    end
end

function love.draw()
    for row = 1 , 4 do
        for col = 1 , 4 do
            if GRID[row][col] ~= 0 then
                love.graphics.draw(tiles[tostring(GRID[row][col])], COLUMNS[col], ROWS[row])
            end
        end
    end
end

function love.update(dt)
    
end