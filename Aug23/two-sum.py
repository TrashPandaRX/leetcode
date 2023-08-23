# my revision of my original idea that i screwed up
class Solution:
	def twoSum(self, nums: list[int], target: int) -> list[int]:
		options = dict()							# we are going to place the values into from enumerate(nums) in here w/ their respective indicies
		for x,y in enumerate(nums):
			seeking = target - y					# we want the other number that would bring us to "target" by subtracting the current value (y)
			#print(seeking)
			#print(options[seeking])
			if seeking in options:					# if we discover the value that helps add up to 'target' return the two needed indicies
				return [options[seeking], x]		# we use options[seeking] because we want the key (which is the indicie from enumerate(nums)) from the key-value pair
			else:									# if we dont find 'seeking' value in options...just throw the value-key into options to be tested later (yes i intentionally said value-key, not key-value because we care more about the indicies (ie the key) at this point)
				#print(options[x], options[y])
				options[y] = x