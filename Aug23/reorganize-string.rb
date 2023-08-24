#https://leetcode.com/problems/reorganize-string/

# INCOMPLETE

# @param {String} s
# @return {String}
def reorganize_string(s)
    #new_s =
    #puts new_s

    # idea for a solution just before my shift:
    # take whatever input and output it as subsets of the alphabet.
    # do a final run over where we check for adjacent issues and put the character anywhere else where there isnt that character.

    s_arr = s.chars
    stock = {}
    for char in s_arr
        if stock.include?(char.to_sym)
            stock[char.to_sym] += 1
            puts "increased # of #{stock[char.to_sym]} in hash"
        else
            stock[char.to_sym] = 1
            puts "added #{char} to hash"
        end
    end

    # could also add about here a condition stipulating if biggest quantity of a char is at least 2 bigger than all other chars combined i think you have to yield "" for the output.
    puts "testing something: #{stock.key(stock.values.max)}"

# explaination of how to use .max_by
# max_element = collection.max_by { |element| criteria }
#hash = { "a" => 10, "b" => 5, "c" => 20 }
#max_pair = hash.max_by { |key, value| value }
#puts max_pair.inspect  # Output: ["c", 20]

    #most_plentiful_char = stock.max_by { |stock.values.max.key, value| value}&.first
    #quantity_of_most_plentiful = stock[most_plentiful_char.to_sym]
    #quantity_of_the_rest = (stock.values.sum - quantity_of_most_plentiful)

    #if quantity_of_the_rest < quantity_of_most_plentiful
    #    return ""
    #end

    #puts most_plentiful_char
    #puts quantity_of_most_plentiful
    #puts quantity_of_the_rest


    # build new string
    new_s = []
    while (stock.values.sum > 0)
        current_most_plentiful = 0
        second_most_plentiful = 0
    end    

=begin
# idea 2: better but slow to setup and also stopped halfway through because of idea 3.
    # run through string and see if there are any dupes adjacent
    if s.length <= 1
        return s
    else
        setup_str = Array.new(s.length, ['',0,0])   # char, index, is it adj to a dupe 0 or 1
        #puts setup_str.inspect
        prior = ""
        s.each_with_index do |char, index|

            if prior == char
                setup_str[index-1] = setup_str[setup_str[index-1][0], setup_str[index-1][1], 1]
                setup_str[index] = [char, index, 1]
            else
                setup_str[index] = [char, index, 0]
            end

            prior = char
        end

        puts setup_str.inspect
    end


idea 1: sloppy incomplete
        prior = ''
        dupes = false
        dupe_loc = []
        s.each_with_index do |char, index|
            if prior == char
                dupes = true
                dupe_loc = []
            end

            prior = char
        end
    end

    # was using the above code ^^^ til i realized i can just use a dictionary instead
=end
end

reorganize_string("aab")
reorganize_string("aaab")