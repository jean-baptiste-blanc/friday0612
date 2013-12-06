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
 		array.better_inject("foo"){1}
 		expect { |b| array.better_inject("foo", &b) }.to yield_with_no_args
 	end
end