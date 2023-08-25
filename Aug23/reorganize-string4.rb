# based heavily on https://leetcode.com/problems/reorganize-string/solutions/3949979/ruby-beats-100-runtime-mem-o-n-o-1-hashmap/
def reorganize_string(s)
	stock = s.chars.tally

	max_count, letter = 0, ""

	# gradually increase the max_count as this iterates through to find the most plentiful char
	stock.each do |char, count|
		if count > max_count
			max_count = count
			letter = char
		end
	end

	#its (s.length+1)/2 because you will have a twin'd char if the most plentiful char consists of at least just over half of the total characters in the string.
	return "" if max_count > (s.length+1)/2

	ans = Array.new(s.length, "")
	index = 0

	# work on the most frequent letter by spacing it out ahead of time
	# and then later we will sprinkle the rest of the characters between
	while stock[letter] != 0
		ans[index] = letter
		index += 2
		stock[letter] -= 1
	end

  # Place rest of the letters in any order.
	stock.each do |char, count|
	    while count > 0
			index = 1 if index >= s.size 
			ans[index] = char
			index += 2
			count -= 1
	    end
	end
	ans.join
	puts ans
end

reorganize_string("aaabbcccccddde")

# write an rspec or minitest test for this, good practice.