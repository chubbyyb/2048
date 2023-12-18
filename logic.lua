function up(code)
    -- Move everything up
    -- I dont know what I did here but it works
    row = 1
    col = 1

    while col ~= 5 do
        row = 1
        while row ~= 4 do
            if GRID[row][col] == 0 and GRID[row+1][col] > 0 then
                i = row
                while i ~= 1  do
                    if(GRID[i - 1][col] > 0) then
                        break
                    end
                    i = i - 1
                end
                GRID[i][col] = GRID[row + 1][col]
                GRID[row + 1][col] = 0
            end
            row = row + 1
        end
        col = col + 1
    end
    if code == 1 then
        return
    end
    mergeUp()
end

function mergeUp()
    operations = 0
    for col = 1, 4 do
        for row = 1, 3 do
            if GRID[row][col] ~= 0 and GRID[row][col] == GRID[row + 1][col] then
                operations = operations + 1
                GRID[row][col] = GRID[row][col] + GRID[row + 1][col]
                GRID[row + 1][col] = 0
            end
        end
    end
    
    if operations > 0 then
        up(1)
    end
end

function right(code)
    row = 1
    col = 1

    while row ~= 5 do
        col = 4
        while col ~= 1 do
            if GRID[row][col] == 0 and GRID[row][col - 1] > 0 then
                i = col
                while i ~= 4  do
                    if(GRID[row][i + 1] > 0) then
                        break
                    end
                    i = i + 1
                end
                GRID[row][i] = GRID[row][col - 1]
                GRID[row][col - 1] = 0
            end
            col = col - 1
        end
        row = row + 1
    end
    if code == 1 then
        return
    end
    mergeRight()
end

function mergeRight()
    operations = 0
    for row = 1, 4 do
        for col = 1, 3 do
            if GRID[row][col] ~= 0 and GRID[row][col] == GRID[row][col + 1] then
                operations = operations + 1
                GRID[row][col] = GRID[row][col] + GRID[row][col + 1]
                GRID[row][col + 1] = 0
            end
        end
    end
    
    if operations > 0 then
        right(1)
    end
end

function left(code)
    row = 1
    col = 1

    while row ~= 5 do
        col = 1
        while col ~= 4 do
            if GRID[row][col] == 0 and GRID[row][col + 1] > 0 then
                i = col
                while i ~= 1  do
                    if(GRID[row][i - 1] > 0) then
                        break
                    end
                    i = i - 1
                end
                GRID[row][i] = GRID[row][col + 1]
                GRID[row][col + 1] = 0
            end
            col = col + 1
        end
        row = row + 1
    end
    if code == 1 then
        return
    end
    mergeLeft()
end

function mergeLeft()
    operations = 0
    for row = 1, 4 do
        for col = 4, 2, -1 do
            if GRID[row][col] ~= 0 and GRID[row][col] == GRID[row][col - 1] then
                operations = operations + 1
                GRID[row][col] = GRID[row][col] + GRID[row][col - 1]
                GRID[row][col - 1] = 0
            end
        end
    end
    
    if operations > 0 then
        left(1)
    end
end

function down(code)
    row = 1
    col = 1

    while col ~= 5 do
        row = 4
        while row ~= 1 do
            if GRID[row][col] == 0 and GRID[row - 1][col] > 0 then
                i = row
                while i ~= 4  do
                    if(GRID[i + 1][col] > 0) then
                        break
                    end
                    i = i + 1
                end
                GRID[i][col] = GRID[row - 1][col]
                GRID[row - 1][col] = 0
            end
            row = row - 1
        end
        col = col + 1
    end
    if code == 1 then
        return
    end
    mergeDown()
end

function mergeDown()
    operations = 0
    for col = 1, 4 do
        for row = 4, 2, -1 do
            if GRID[row][col] ~= 0 and GRID[row][col] == GRID[row - 1][col] then
                operations = operations + 1
                GRID[row][col] = GRID[row][col] + GRID[row - 1][col]
                GRID[row - 1][col] = 0
            end
        end
    end
    
    if operations > 0 then
        down(1)
    end
end

function spawnTiles()
    -- Spawn a tile at a random position
    -- The tile can be either 2 or 4
    -- The tile can only spawn at an empty position
    -- The tile can only spawn at a position where there is no tiles
    emptySpaces = {}
    for row = 1, 4 do
        for col = 1, 4 do
            if GRID[row][col] == 0 then
                table.insert(emptySpaces, {row, col})
            end
        end
    end
    if #emptySpaces == 0 then
        return
    end

    math.randomseed(os.time())
    randomNum = math.random(1, #emptySpaces)
    randomTile = math.random(1, 2)
    if randomTile == 1 then
        randomTile = 4
    end

    GRID[emptySpaces[randomNum][1]][emptySpaces[randomNum][2]] = randomTile
end

function getSum()
    sum = 0
    for row = 1, 4 do
        for col = 1, 4 do
            sum = sum + GRID[row][col]
        end
    end
    return sum
end