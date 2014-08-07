class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for signing up. You will receive an SMS shortly with verification instructions"
    client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
    client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: @user.phone,
      body: 'Welcome to Lotus! To verify your account, please reply HELLO to this message.')
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit!
  end
end
