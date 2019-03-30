# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
def palindrome(w, j, k)
    while j < k
        if w[j]!=w[k]
            return 0
        end
        j+=1
        k-=1
    end
    return 1
end

@n = gets.to_i
@n.times do
    word = gets.chomp
    word = word.downcase
    
    #suppose it is a palindrome
    palindrome = 1
    
    j = 0
    k = word.length-1
    
    #check if it is not a palindrome
    while j < k
        if word[j]!=word[k]
            #in case of different characters
            #check palindrome for
            #replacement, addition and removal
            remleft = palindrome(word, j+1, k)
            remright = palindrome(word, j, k-1)
            replace = palindrome(word, j+1, k-1)
            
            #if 0, there neither case is it a palindrome
            if remleft+remright+replace == 0
                palindrome = 0
            end
            break
        end
        j+=1
        k-=1
    end
    
    print palindrome
end