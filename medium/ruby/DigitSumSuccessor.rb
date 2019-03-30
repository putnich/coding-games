# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@digit = @n.to_s
@len = @digit.length
@l = -1
@out = ""

#trailing zeros
(@len-1).downto(0) do |i|
    if @digit[i]!="0"
        @l = i
        break
    else
        @out += "0"
        @l-=1
    end
end

#first number before trailing zeros
@out += (@digit[@l].to_i - 1).to_s
@l-=1

#nines
@l.downto(0) do |i|
    if @digit[i]!="9"
        @l = i
        break
    else
        @out += "9"
        @l-=1
    end
end

#all the remaining digits
@remaining = ""
for i in 0..@l
    @remaining+=@digit[i]
end
if @remaining == ""
    @out = "1" + @out
else 
    @out = (@remaining.to_i + 1).to_s + @out
end
puts @out