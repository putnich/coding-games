# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@start, @n = gets.split(" ").collect {|x| x.to_i}

@len = 0
@prev = 0;

for i in 0..@n-1
    @prev = @start
    @len = 0;
    #get binary representation of the number
    while @start > 0 do
        rem = @start%2
        @len += rem>0? 3:4
        @start /= 2
    end
    
    @start = @len
    
    #at some point all next numbers will be equal
    if @prev==@start 
        break 
    end
end
puts @len