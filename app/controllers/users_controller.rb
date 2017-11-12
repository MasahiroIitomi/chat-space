class UsersController < ApplicationController

  before_action :move_to_signin, only: :edit

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to "/"
    else
      render :edit
    end
  end

# requireをつける
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def move_to_signin
    redirect_to "/users/sign_in" unless user_signed_in?
  end

end
