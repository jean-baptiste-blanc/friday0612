require_relative '../lib/take_away'
describe TakeAway do
	let(:take_away) {TakeAway.new}
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

	xit " should send a text message if the total is correct" do
 		
	end




end