class Users::SessionsController < Devise::SessionsController
  def create
    super
    # create a new login record for this user if login was successful
    if user_signed_in?
      @user = User.where(:email => params[:user][:email] ).first
      login_record = LoginRecord.new
      login_record.date = Time.now
      @user.login_records << login_record
      login_record.save
    end
  end
end
