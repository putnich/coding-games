# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@order = gets.chomp
@side = gets.chomp

paper = Hash.new
paper["R"] = 1
paper["L"] = 1
paper["U"] = 1
paper["D"] = 1
for i in 0..@order.length
    #add layers to the opposite side
    #set layer equal to one to the folded side
    #and double all the others
    case @order[i]
    when "R"
        paper["L"] += paper["R"]
        paper["R"] = 1
        paper["U"] *= 2
        paper["D"] *= 2
    when "L"
        paper["R"] += paper["L"]
        paper["L"] = 1
        paper["U"] *= 2
        paper["D"] *= 2
    when "U"
        paper["D"] += paper["U"]
        paper["U"] = 1
        paper["L"] *= 2
        paper["R"] *= 2
    when "D"
        paper["U"] += paper["D"]
        paper["D"] = 1
        paper["L"] *= 2
        paper["R"] *= 2
    end
end

puts paper[@side]