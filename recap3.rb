require "byebug"
def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end

    newarr = []

    hash.each do |k,v|
        if v == 1
            newarr << k
        end
    end

    return newarr

end


# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele, idx|
        arr.each_with_index do |ele1, idx1|
            if idx+1 == idx1
                if ele == ele1
                    return false
                end
            end
        end
    end

    return true
end


# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    hash = Hash.new([])
    arr = str.split("")
    newarr = arr.uniq
    newarr.each do |ele|
        hash[ele] = []
    end
    arr.each_with_index do |ele, idx|
        hash[ele] << idx
    end
    return hash
end


# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(string)
    arr = string.split("")

    if no_consecutive_repeats?(arr)
        return arr[-1]
    end

    count = 1
    newarr = []
    # debugger
    arr.each_with_index do |ele, idx|
        if idx != arr.length-1
            if ele == arr[idx+1]
                count +=1
            else
                newarr << [ele, count]
                count = 1
            end
        else
            newarr << [ele, count]
        end
        
    end
    largest = ""
    counter = 0
    newarr.each do |smallarr|
        if counter <= smallarr[1]
            counter = smallarr[1]
            largest = smallarr[0]
        end
    end

    return largest * counter

end


# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    prime = []
    (2...num).each do |number|
        if prime?(number)
            prime << number
        end
    end
    prime.each_with_index do |num1, idx1|
        prime.each_with_index do |num2, idx2|
            # debugger
            if idx2 >= idx1
                if num1 * num2 == num
                    return true
                end
            end
        end
    end
    return false
end

def prime?(num)
    if num == 2
        return true
    end
    (2...num).each do |number|
        if num % number == 0
            return false
        end
    end
    return true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to_a
    place = 0
    newarr = message.split("")
    betterArr = []
    # debugger
    newarr.each_with_index do |letter, idx|
        keysIndex = (place % keys.length)    #might be length -1 

        currentIdx = alphabet.index(letter)
        newIdx = (currentIdx + keys[keysIndex]) % 26

        betterArr << alphabet[newIdx]
        place += 1
    end
    
    return betterArr.join("")
   
end


# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"



def vowel_rotate(str)
    vowels = []
    indexes = []
    vowel = "aeiou"
    arr = str.split("")
    arr.each_with_index do |letter, idx|
        if vowel.include?(letter)
            vowels << letter 
            indexes << idx
        end
    end
    arr.each_with_index do |ele, idx|

    end
    indexes.each_with_index do |num, idx|
        if idx == 0
           arr[num] = vowels[-1]
        else
            arr[num] = vowels[idx-1]
        end

    end

    return arr.join("")
end


# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String
    def select(&prc)
        if prc == nil
            return ""
        end
        arr = []
        newarr = self.split("")
        newarr.each do |letter|
            if prc.call(letter)
                arr << letter
            end
        end
        return arr.join("")
    end

    def map!(&prc)
      

        self.each_char.with_index do |letter, idx|
            self[idx] = prc.call(letter, idx)
            
        end
    end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    # debugger
    if (a == 0 )|| (b == 0)
        return 0
    end
    if a == 1
        return b
    end
    if b == 1
        return a
    end
    if a < 0 && b < 0
        return b.abs + multiply(((a.abs)-1), (b.abs))
    end
    if b < 0
        return b + multiply((a-1), b)
    end
    if a < 0
        return a + multiply(a, (b-1))
    end

    return b + multiply(a-1, b)
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    if n == 0
        return []
    end
   
    if n == 1
        return [2]
    end

    if n == 2
       return [2,1]
    end
   
    newarr = lucas_sequence(n-1)
    nextnum = newarr[-1] + newarr[-2]
    newarr << nextnum
   return newarr.flatten
    

end


# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    if prime?(num)
        return [num]
    end

    if bi_prime?(num)
        
    end
end




prime_factorization(12)     # => [2, 2, 3]
prime_factorization(24)     # => [2, 2, 2, 3]
prime_factorization(25)     # => [5, 5]
prime_factorization(60)     # => [2, 2, 3, 5]
prime_factorization(7)      # => [7]
prime_factorization(11)     # => [11]
prime_factorization(2017)   # => [2017]
