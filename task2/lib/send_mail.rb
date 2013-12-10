require 'mail'

module SendMail


	options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            # :domain               => 'your.host.name',
            :user_name            => ENV["EMAIL"],
            :password             => ENV["PASSWORD"],
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
          
  Mail.defaults do
    delivery_method :smtp, options
  end

	def send_email(message)
		mail = Mail.deliver do
      from    ENV["EMAIL"]
      to      'jbblanc@gmail.com'
      subject 'Your order'
      body    message
		end
	end

end