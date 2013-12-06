class Array

	def better_inject(initial = nil)
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

	def better_inject_recursion(initial = nil,n=nil,&block)
		result = 0
		n ||= 0
		return result if n == self.length
		current_element = initial.nil? ? self[n] : initial
		n+=1
		result = yield(better_inject_recursion(nil,n,&block),current_element)
		end
end


array = [1,2,3,4]

 puts array.inject{|result,element| result + element}
 puts array.better_inject_recursion{|result,element| result + element}
 
