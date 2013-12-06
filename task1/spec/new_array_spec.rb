require_relative '../lib/new_array.rb'

describe Array do

	let(:array) {Array.new}

 	it "Array should have a method better inject" do
 		should respond_to(:better_inject) 
 	end

 	it "better_inject should take and argument" do
		array.should_receive(:better_inject).with(0)
 		array.better_inject(0){1}

 	end

 	it "better_inject should take a block" do
 		array.better_inject(0){1}
 		expect { |b| array.better_inject("foo", &b) }.to yield_with_no_args
 	end

 	it "should return the same result as inject with an initial value" do
 		expect([1,2,3,4].better_inject(0){|result,element| result + element} == [1,2,3,4].inject(0){|result,element| result + element}).to be_true
 	end
end