class UserRegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name,:last_name,:email, :password) }
  end
end