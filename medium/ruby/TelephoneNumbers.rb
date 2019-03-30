#tree containing all the numbers
class Tree
    attr_accessor :root
    
    def initialize
        @root = Node.new("root")
    end
    
    #depth-first traversal
    def nodes_count(n)
        result = 1
        if !n.children.empty?
            n.children.each do |c|
                result = result + nodes_count(c)
            end
        end
        return result
    end
end

class Node
    attr_accessor :num, :children
    
    def initialize(num)
        @num = num
        @children = Array.new
    end
    
    #if tree contains number return corresponding node
    #if not, add new digit to the children of the node
    def self.add_num(n, num)
        m = nil
        if !n.children.empty?
            n.children.each do |c|
                if c.num == num
                    return c
                end
            end
        end
        m = Node.new(num)
        n.children << m
        
        return m
    end
end
@n = gets.to_i
t = Tree.new
root = t.root
@n.times do
    n = root
    telephone = gets.chomp.split('')
    #adding digit by digit
    telephone.each do |num|
        n = Node.add_num(n, num)
    end
        
end

# The number of elements (referencing a number) stored in the structure.
puts t.nodes_count(t.root) - 1