require_relative '../lib/take_away'
describe TakeAway do
	let(:take_away) {TakeAway.new}
	let(:order){['Burger','French Fries']}

	it "TakeAway should have a list of dishes" do
		expect(TakeAway::DISHES).to be_a_kind_of(Hash)
	end

	it "TakeAway should have a method better inject" do
		should respond_to(:check_order_price?) 
	end

	it "check_order_price should take two argument" do 
		order = []		
		take_away.should_receive(:check_order_price?).with(order,2)
 		take_away.check_order_price?([],2)
	end
	
	it "check_order_price should know the sum of the prices during an order" do
		expect(take_away.check_order_price?(order,13)).to be_true
	end


end