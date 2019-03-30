STDOUT.sync = true # DO NOT REMOVE
# Don't let the machines win. You are humanity's last hope...

@width = gets.to_i # the number of cells on the X axis
@height = gets.to_i # the number of cells on the Y axis

@grid = Array.new

@height.times do
    line = gets.chomp.split('') # width characters, each either 0 or .
    line.each do |x|
        @grid << x
    end
end

for i in 0..@grid.length-1

    #if connection
    if @grid[i] == "0" 
        #calculate the location in the grid by using array index
        x = (i+@width) % @width
        y = i / @width
        
        #print current node
        print x.to_s + " " + y.to_s
        
        #suppose there is no right
        rightn = " -1 -1"
        
        #if not rightmost node
        if x < @width - 1
            r = 1
            #loop through all right nodes of the current node
            #and if connection exist
            #calculate the coordinates for the nearest right
            while r < @width - x && rightn==" -1 -1" do
                if @grid[i+r] == "0"
                    xr = (i+r+@width)%@width
                    yr = (i+r) / @width
                    rightn = " "+xr.to_s+" "+yr.to_s
                    break
                end
                r+=1
            end
        end
        print rightn
        
        #suppose there is no bottom node
        bottomn = " -1 -1"
        
        #if not bottommost node
        if y < @height - 1
            b = 1
            #loop thorugh all bottom nodes of the current node
            #and if connection exist
            #calculate the coordinates for the nearest bottom
            while b < @height - y  do
                if @grid[i+b*@width] == "0"
                    xb = (i+b*@width) / @width
                    yb = (i+b*@width+@width) % @width
                    bottomn = " "+yb.to_s + " "+ xb.to_s
                    break
                end
                b+=1
            end   
        end
        print bottomn
        
        puts ""
    end
end