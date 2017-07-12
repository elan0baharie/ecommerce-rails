class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      @account = Account.new
      @account.user_id = @user.id
      if @account.save
        session[:account_id] = @user.id
        flash[:notice] = "Account Created"
        redirect_to "/"
      end
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end
