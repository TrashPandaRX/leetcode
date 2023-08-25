# still terrible and quite incomplete and messy
# take a step back and strip the problem down to the original requirement and hit the biggest roadblocks
# no twins of any characters, so space them out using the other chars
# return "" if you cant avoid twins
# identify the most plentiful character each pass
# hmm you could technically just set all characters down ahead of time EOS (every other space)
# i think this is the best way to handle this problem instead of this convoluted mess this has turned into

# @param {String} s
# @return {String}
def reorganize_string(s)
    s_arr = s.chars
    stock = {}
    for char in s_arr
        if stock.include?(char.to_sym)
            stock[char.to_sym] += 1
            #puts "increased # of #{stock[char.to_sym]} in hash"
        else
            stock[char.to_sym] = 1
            #puts "added #{char} to hash"
        end
    end

    # could also add about here a condition stipulating if biggest quantity of a char is at least 2 bigger than all other chars combined i think you have to yield "" for the output.
    most_plentiful_key_value_pair = [stock.key(stock.values.max), stock[stock.key(stock.values.max)]]
    puts "most_plentiful_key_value_pair: #{most_plentiful_key_value_pair}"
    quantity_of_the_rest = (stock.values.sum - most_plentiful_key_value_pair[1])
    puts "quantity_of_the_rest: #{quantity_of_the_rest}"


    if quantity_of_the_rest < most_plentiful_key_value_pair[1]-1
        return ""
    end

    # build new string
    # almost done. gotta fix the logic some
    new_s = []
    tail = stock.values.sum
    head = 0
    while (head < tail)
        max_quantity = stock.values.max
        tied_keys = stock.select{ |key, value| value == max_quantity }.keys
        puts "tied keys: #{tied_keys}"
        #puts "#{tied_keys.first}"


        current_most_plentiful = tied_keys.first.to_s

#        begin
#            current_most_plentiful == new_s[head-1]
#        rescue
#        end

        #puts "#{current_most_plentiful} vs #{new_s[head-1]}"
        #puts "#{current_most_plentiful.class} vs #{new_s[head-1].class}"
        #puts "#{current_most_plentiful == new_s[head-1]}"


        if ((head > 0) && (current_most_plentiful == new_s[head-1]))
            puts "last value: #{new_s[head-1]}"
            current_most_plentiful = tied_keys[1]
        else

        end 
        puts "current_most_plentiful: #{current_most_plentiful}"
        #puts current_most_plentiful.class

        char = current_most_plentiful.to_s[0]
        #puts "#{char}"

        new_s.push(char)
        puts "updated array: #{new_s}"
        #puts "how many of this char left? #{stock[current_most_plentiful]}"
        
        stock[current_most_plentiful.to_sym] -= 1
        head += 1
    end

    puts new_s
    return new_s.join("")

=begin
# idea 4: ...look at clusters of 2 characters at a time and just make sure dupes dont touch
# if they do touch...increase the range you look at by 1 and see if you can move characters around within that range safely.

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