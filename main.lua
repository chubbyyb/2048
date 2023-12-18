



function love.keypressed(key)
    if(key == "escape") then
        love.event.quit()
    end
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

    ROW_1 = HEIGHT/4
    ROW_2 = HEIGHT/2 - 50
    ROW_3 = HEIGHT/2 + 50
    ROW_4 = HEIGHT/2 + 150

    TILE_DIMENSIONS = 100 -- 100x100


    -- LOAD THE GRID
    gridRow_1 = {1, 0, 0, 0}
    gridRow_2 = {0, 0, 0, 0}
    gridRow_3 = {0, 0, 0, 0}
    gridRow_4= {0, 0, 0, 0}

    -- lOAD THE CARDS
    tiles = {}

    i = 2
    while i < 8193 do
        tiles[tostring(i)] = love.graphics.newImage("Tiles/" .. i .. ".png")
        i = i * 2
    end
end

function love.draw()
    love.graphics.draw(tiles["2"], COL_1, ROW_1)
    love.graphics.draw(tiles["4"], COL_2, ROW_1)
    love.graphics.draw(tiles["4"], COL_3, ROW_1)
    love.graphics.draw(tiles["4"], COL_4, ROW_1)

    love.graphics.draw(tiles["8"], COL_1, ROW_2)
    love.graphics.draw(tiles["8"], COL_1, ROW_3)
    love.graphics.draw(tiles["8"], COL_1, ROW_4)
end

function love.update(dt)
    
end