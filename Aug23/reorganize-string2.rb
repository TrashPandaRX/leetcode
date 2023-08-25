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
    count = stock.values.sum
    while (count > 0)
        current_most_plentiful = stock.key(stock.values.max)
        puts "current_most_plentiful: #{current_most_plentiful}"
        puts current_most_plentiful.class

        char = current_most_plentiful.to_s[0]
        puts "#{char}"

        new_s.push(char)
        puts "#{new_s}"
        puts "how many of this char left? #{stock[current_most_plentiful]}"
        
        stock[current_most_plentiful] -= 1
        count -= 1
    end

    puts new_s

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