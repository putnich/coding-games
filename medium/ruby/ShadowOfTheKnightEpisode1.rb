STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
@w, @h = gets.split(" ").collect {|x| x.to_i}
@n = gets.to_i # maximum number of turns before game over.
@x0, @y0 = gets.split(" ").collect {|x| x.to_i}

@low_x = 0;
@low_y = 0;
@high_x = @w;
@high_y = @h;
            
# game loop
loop do
    bomb_dir = gets.chomp # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)
    
    #setting low and high X and Y depending on 
    # the current location and direction so that
    #we can narrow down the search
    if bomb_dir.include? "U"
        @high_y = @y0;
    end
    if bomb_dir.include? "L"
        @high_x = @x0;
    end
    if bomb_dir.include? "R"
        @low_x = @x0;
    end
    if bomb_dir.include? "D"
        @low_y = @y0;
    end
    
    #updating coordinates
    @x0=(@low_x + @high_x) / 2;
    @y0=(@low_y + @high_y) / 2;
    
    #printing where Batman should jump next
    puts @x0.to_s+" " +@y0.to_s
    
end