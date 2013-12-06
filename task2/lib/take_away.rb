require 'twilio-ruby'

class TakeAway

	@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_TOKEN']

	DISHES = { "Burger" => 10,
					 "French Fries"  => 3,
					 "Salad"  => 5,
					 "steack" => 14
					}

	# def dishes
	# 	DISHES
	# end

	def check_order_price(order,expected_price)
		sum = 0
		order.each{|dish| sum += DISHES[dish]} == expected_price ? send_text : raise 
	end

	def send_text
		 @client.account.sms.messages.create(:body => "Thank you !Your order was placed and will be delivered before 18:52",:to => "+447547358854",:from => "+14158141829")
	end
end