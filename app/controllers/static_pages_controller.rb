class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	@products = Product.limit(3)
  end

  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  #UserMailer.contact_form(@email, @name, @message).deliver_now
  ActionMailer::Base.mail(from: @email,
      to: 'ibtesam.dh2@gmail.com',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
end


def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save

      # Sends email to user when user is created.
      ExampleMailer.sample_email(@user).deliver

      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

end
