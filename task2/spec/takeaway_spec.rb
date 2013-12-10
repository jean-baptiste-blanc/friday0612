require_relative '../lib/take_away'
require 'mail'

describe TakeAway do

	Mail.defaults do
	   delivery_method :test
	end
	include Mail::Matchers

	let(:take_away) {TakeAway.new}

	let(:order){ {'Burger' => 3,'French Fries' => 2} }

	# it's the convention to start the test description with a verb	
	it "should have a list of dishes" do
		# You're testing too much here. Test the functionality instead
		# Tests should be independent. There's no way this test fails
		# while all others pass, so it isn't necessary
		expect(TakeAway::DISHES).to be_a_kind_of(Hash)
	end

	it "should have a method to register orders" do
		# Same here. There's no way this test fails while others (written properly) fail		
		should respond_to(:register_order) 
	end

	it "check_order_price should take two argument" do 
		# This test is absolutely useless. Proof: put "raise 'fuck'" into the method
		# and this test will still pass.
		# Your tests should fail if the implementation of the method changes.
		# If you can change the implementation and the method still passes,
		# the test is useless
		order = {}		
		take_away.should_receive(:register_order).with(order,2)
		# it's stubbed, so the real implementation never gets called		
 		take_away.register_order({},2)
	end

	it "should have a check order price method" do
		# don't check for the existence of the methods, check
		# whether they work as expected instead
		should respond_to(:check_order_price?) 
	end

	# This test is better
	it 'should  tell  what the time will be in  an hour' do		
    time = Time.new(1) # but you don't need to pass 1 here. Any midnight would do
    expect(Time).to receive(:new).and_return(time)
    expect(take_away.in_an_hour).to eq '01:00'
  end

  # This is another useless test. 
  # I can change implementation in any way I want and it will pass
  # JB, tests MUST fail if the implementation changes
	it "check_order_price should take two argument" do 
		order = {}
		take_away.should_receive(:check_order_price?).with(order,2)
 		take_away.check_order_price?({},2)
	end
	
	# This is good
	it "check_order_price should check the total of an order" do
		expect(lambda{take_away.register_order(order,15)}).to raise_error(RuntimeError)
	end

	# this test fails because I don't have ENV["EMAIL"] set
	# If your code uses env vars, provide sensible defaults if possible
	# or set env vars in the test, so that it didn't fail
	# The reason is that a new developer joining the project
	# shouldn't have to debug why tests are failing right after
	# checking out the code
	it " should send a email if the total is correct" do
		take_away.register_order(order,36)
		take_away.should have_sent_email.to('jbblanc@gmail.com')
 		
	end




end