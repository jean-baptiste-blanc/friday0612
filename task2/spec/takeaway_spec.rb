require_relative '../lib/take_away'
require 'mail'

	

describe TakeAway do

	Mail.defaults do
	   delivery_method :test
	end
	 include Mail::Matchers


	#  before(:each) do
 #    Mail::TestMailer.deliveries.clear
 #  end
	
	let(:take_away) {TakeAway.new}
	# double_take_away = double(take_away)

	let(:order){ {'Burger' => 3,'French Fries' => 2} }

	it "TakeAway should have a list of dishes" do
		expect(TakeAway::DISHES).to be_a_kind_of(Hash)
	end

	it "TakeAway should have a method to register orders" do
		should respond_to(:register_order) 
	end

	it "check_order_price should take two argument" do 
		order = {}		
		take_away.should_receive(:register_order).with(order,2)
 		take_away.register_order({},2)
	end

	it "TakeAway should have a check order price method " do
		should respond_to(:check_order_price?) 
	end

	it 'TakeAway should  tell  what the time will be in  an hour ' do
    time = Time.new(1)
    expect(Time).to receive(:new).and_return(time)
    expect(take_away.in_an_hour).to eq '01:00'
  end

	it "check_order_price should take two argument" do 
		order = {}
		take_away.should_receive(:check_order_price?).with(order,2)
 		take_away.check_order_price?({},2)
	end
	
	it "check_order_price should check the total of an order" do
		expect(lambda{take_away.register_order(order,15)}).to raise_error(RuntimeError)
	end

	it " should send a email if the total is correct" do
		take_away.register_order(order,36)
		take_away.should have_sent_email.to('jbblanc@gmail.com')
 		
	end




end