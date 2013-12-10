class Array

	def better_inject(initial = nil)
		result = 0
		if !initial.nil?
			result = initial
  	else
			result = self[0]
			# I wrote a test that fails because of this line			
			self.shift
		end
		self.each {|element| result = yield(result,element)}
		result
	end

	# the recursive implementation should have the same signature
	# you can have another private method that has a different signature
	# for example:
	#   def better_inject_recursion(initial = nil, &block)
	#     better_inject_recursion_array(self.dup, initial, &block)
	#   end	
	#   private
	#   instead of passing n, you can pass a smaller array each time, it'll be cleaner
	#   def better_inject_recursion_array(array, initial)
	#     ...
	def better_inject_recursion(initial = nil,n=nil,&block)
		result = 0
		n ||= 0
		return result if n == self.length
		current_element = initial.nil? ? self[n] : initial
		n+=1
		result = yield(better_inject_recursion(nil,n,&block),current_element)
		end
end


# Don't print stuff in the code :) Write tests instead 
