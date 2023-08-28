class MyStack
    def initialize()
        @queue = []
    end

# stack vs queue:

# stack --> bottom [0,1,2,3,4] top
# push puts value after the 4, pop removes and returns the last item in the stack (LIFO)

# queue --> head [a, b, c, d, e] tail
# adding items to a queue means you add them after the last item (tail item), and removing items from a queue means taking the lead item, "a"", and shifting the rest of the queue up by one as you return the "a"

=begin
    :type x: Integer
    :rtype: Void
=end
    # stacks want this added to the top of the stack
    # queues want this added to the end of the queue
    def push(x)
        @queue << x
    end

=begin
    :rtype: Integer
=end
    # stacks want the last item added to the stack
    # queues want the first item in the queue
    def pop()
        result = @queue[-1] # .first would return the item that was originally pushed first.
        puts "first item in queue: #{result}"
        @queue.delete_at(-1)
        return result
    end

=begin
    :rtype: Integer
=end
    def top()
        return @queue[-1]
    end

=begin
    :rtype: Boolean
=end
    def empty()
        return @queue.length == 0
    end

end

# me testing if things worked the way i expected
#obj = MyStack.new()
#obj.push("doesnt matter")


# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()