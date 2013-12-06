require_relative '../lib/mail'
class TakeAway

	include SendMail

	DISHES = { "Burger" => 10,
					 "French Fries"  => 3,
					 "Salad"  => 5,
					 "steack" => 14
					}

	def in_an_hour 
    time = Time.new
    time = time + (60*60)
    time.strftime('%H:%M')
  end

	def register_order(order,expected_price)
			order_error unless check_order_price?(order,expected_price)
			send_email("Thank you !Your order was placed and will be delivered before #{in_an_hour}") 
	end

	def order_error
			raise "something went wrong with your order."
	end

	def check_order_price?(order,expected_price)
		order.inject(0){|price,dish| price += DISHES[dish[0]] * dish[1] } == expected_price
	end

	


end
