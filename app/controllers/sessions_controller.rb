class Users::SessionsController < Devise::SessionsController
  
  before_action :rejected_user, only: [:create]
  
  protected
  
  def rejected_user
    @user = User.find_by(email: parmas[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end