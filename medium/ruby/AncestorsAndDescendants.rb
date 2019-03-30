# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Node
    attr_accessor :nex, :v
    def initialize(v, nex)
        @v = v
        @nex = nex
    end
    
    def dots()
        sum = 0
        for i in 0..@v.length
            if @v[i]=="." 
                sum+=1
            end
        end
        return sum
    end
end

class LinkedList
    attr_accessor :first, :t
    def initialize(v)
        @first = Node.new(v, nil)
        @t = @first
    end
    def add_node(v) 
        @t.nex = Node.new(v, nil)
        @t = @t.nex
    end
    
    def replace_node(v, d)
        t = @first
        while t!=nil && t.dots()!=d
            t = t.nex
        end
        t.nex = nil
        t.v = v
        @t = t
        
    end
    
    def print_list
        t = @first
        while t!=nil
            print t.v.tr('.', '')
            if(t.nex!=nil) 
                print " > "
            end
            t = t.nex
        end
        puts ""
    end
end


@count = gets.to_i

@l = LinkedList.new("")

@count.times do
    line = gets.chomp
    
    if @l.first.v == ""
         @l.first.v = line
         next
    end
    
    #number of dots of the current line
    dots = 0
    for i in 0..line.length
        if line[i]=="."
            dots+=1
        end
    end
    
    #number of dots of the previous line
    pdots = @l.t.dots() 
    
    #if current dots are less than previous dots
    #print the list
    #replace node that has pdots with current node and delete next nodes
    #else add new node to the list
    if dots<=pdots
        @l.print_list()
        @l.replace_node(line, dots)

    else
        @l.add_node(line)
    end
    
end

@l.print_list()
