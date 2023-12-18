gridRow_1 = {2, 0, 0, 0}
gridRow_2 = {0, 0, 0, 2}
gridRow_3 = {2, 0, 0, 0}
gridRow_4= {2, 2, 2, 0}


GRID = {gridRow_1, gridRow_2, gridRow_3, gridRow_4}

running = 1


function up()
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
end


while(running) do
    for row = 1 , 4 do
        for col = 1 , 4 do
            io.write(GRID[row][col])
        end
        io.write("\n")
    end

    print("Press up, down, left, right to move the tiles")
    if(string.lower(io.read("l")) == "w") then
        up()
    end
end