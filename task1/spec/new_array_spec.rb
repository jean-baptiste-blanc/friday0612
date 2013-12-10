require_relative '../lib/new_array.rb'

describe Array do

	let(:array) {Array.new}

 	it "Array should have a method better inject" do
 		should respond_to(:better_inject) 
 	end

 	it "better_inject should take and argument" do
    # JB, you're writing pointless tests again :)
    # There's no way in hell this test will fail    
		array.should_receive(:better_inject).with(0)
 		array.better_inject(0){1}
    # To test that it takes an argument, you could do
    #    expect { array.better_inject(0) {} }.not_to raise_error(ArgumentError)
    # but I wouldn't test it at all: this functionality is implied by other tests
 	end

 	it "should return the same result as inject with an initial value" do
 		expect([1,2,3,4].better_inject(0){|result,element| result + element} == [1,2,3,4].inject(0){|result,element| result + element}).to be_true
 	end

  # indentation
 	it "Array should have a method better inject" do
    # unnecessary test, it's implied by other tests
 		should respond_to(:better_inject_recursion) 
 	end

 	it "better_inject should take and argument" do 		
    # same as line 12
		array.should_receive(:better_inject_recursion).with(0)
 		array.better_inject_recursion(0){1}
 	end

 	it "should return the same result as inject with an initial value" do
 		array = [1,2,3,4]
 		expect(array.better_inject_recursion{|result,element| result + element} == array.inject{|result,element| result + element}).to be_true
 		expect(array).to eq([1,2,3,4])
 	end

  # I'd write more tests:
  # what if the array is empty
  # what if all elements are the same
  # what if the first element is nil
  # etc
  # Try to test all edge cases

  it "should not change the original array" do
    array = [1,2,3]
    array.better_inject {}
    expect(array.length).to eq(3)
  end

end