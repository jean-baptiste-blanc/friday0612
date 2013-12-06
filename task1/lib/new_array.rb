class Array

	def better_inject(initial = nil)
		array = []
		result = 0
		if !initial.nil?
			result = initial
  	else
			result = self[0]
			self.shift
		end
		self.each {|element| result = yield(result,element)}
		result
	end

end


puts [1,2,3,4].better_inject(0){|result,element| result - element}
puts [1,2,3,4].inject(0){|result,element| result - element}