class UsersController < ApplicationController

  def edit
  end

  def update

    redirect_to "/"
  end

  private
  def user_params
    params.permit(:name, :email)
  end

end
