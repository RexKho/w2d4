require "byebug"
# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowel = ["a", "e", "i", "o", "u"]
    newarr = []
    words.each_with_index do |word1, idx1|
        string = ""
        words.each_with_index do |word2, idx2|
            if idx2> idx1
                string = "#{word1} #{word2}"
                if vowel.all? { |vow| string.include?(vow)}
                    newarr << string
                end
            end
        end
    end
    return newarr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
 
    (2...num).each do |number|
        if num % number == 0
            return true
        end
    end
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    newarr = []
    bigrams.each do |bi|
        if str.include?(bi)
            newarr << bi
        end
    end
    return newarr
    # arr = str.split("")
    # newarr = []
    # arr.each_with_index do |let1, idx1|
    #     arr.each_with_index do |let2, idx2|
    #         if idx2 == (idx1+1)
    #             bigrams.each do |bi|
    #                 str = "#{let1}#{let2}"
    #                 if bi == str
    #                     newarr << bi
    #                 end
                    
    #             end
    #         end
    #     end
    # end
    # return newarr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||=  Proc.new { |k, v| k == v} 
        hash = Hash.new()
        self.each do |k, v|
            if prc.call(k, v)
                hash[k] = v
            end
        end
        return hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        length ||= -1
        newarr = self.split("")
        newnewarr = []
        # debugger
        newarr.each_with_index do |let1, idx1|
            newarr.each_with_index do |let2, idx2|
                if idx1 == idx2
                    newnewarr << let1
                end
                if idx2 > idx1
                    newnewarr<< newarr[idx1..idx2].join("")
                end 
            end
        end

        
        if length == -1
            return newnewarr
        else
            arr = []
            newnewarr.each do |sub|
                if sub.length == length
                    arr << sub
                end
            end
            return arr
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = ("a".."z").to_a
        newarr = self.split("")
        arr = []
        newarr.each do |let|
            newlet = (alphabet.index(let) + num) % 26
            arr << alphabet[newlet]
        end
        return arr.join("")
    end
end
