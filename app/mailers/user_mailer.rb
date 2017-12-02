class UserMailer < ApplicationMailer
	default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'ibtesam.dh2@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
  	@appname = "IBTE Fashion"
  	mail(to: user.email,
       subject: "Welcome to #{@appname}!")
  end

  def order_placed(user, product)
      @user = user
      @product = product
      mail(from: 'ibtesam.dh2@gmail.com',
           to: user.email,
           subject: "Your order of the #{product.name} has been placed. Thank you for purchase")
  end
end
