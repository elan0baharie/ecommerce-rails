class AccountsController < ApplicationController
  def index

  end

  def new

  end

  def create

  end

  def edit

  end

  private
    def account_params
      params.require(:account).permit(:user_id)
    end
end
