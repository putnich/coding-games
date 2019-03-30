# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r = gets.to_i
@l = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
res = [@r]

for i in 1..@l-1
    out = Array.new
    cprev = 1
    for j in 0..res.length-1
        #in the line, if current and next characters are equal
        #increment cprev which is the count of digit repetitions
        #and when next is different, add the count and digit to the output
        if j+1 < res.length && res[j]==res[j+1]
            cprev+=1
        else
            out << cprev << res[j]
            cprev = 1
        end
    end
    res = out
end

puts res.join(" ")