require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    i = 1
    # debugger
    until i == (num_1*num_2) do
        if (i % num_1 == 0)  && (i % num_2 == 0)
            return i
        end

        i += 1
    end
    least = num_1 * num_2
    return least
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    newarr = str.split("")
    arr = []
    newarr.each_with_index do |let1, idx1|
        newarr.each_with_index do |let2, idx2|
            if idx2 == (idx1+1)
                str = "#{let1}#{let2}"
                arr << str
            end
        end
    end
    # debugger
    hash = Hash.new(0)
    arr.each do |com|
        hash[com] += 1
    end

    nextarr = hash.sort_by {|k,v| v}.reverse
    return nextarr[0][0]

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        newhash = Hash.new()
        self.each do |k,v|
            newhash[v] = k
        end
        return newhash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if idx2 > idx1
                    if ele1 + ele2 == num
                        count +=1

                    end
                end
            end
        end

        return count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b }
        sorted = false
        while !sorted
            sorted = true 
            self.each_with_index do |ele, idx|
            # debugger
                if idx != self.length-1
                    if prc.call(ele, self[idx+1]) == 1
                
                        sorted = false
                        self[idx], self[idx+1] = self[idx+1], self[idx]
                
                    end
                end

            end
        end

        return self
        
    end
end
