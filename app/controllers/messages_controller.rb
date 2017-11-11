class MessagesController < ApplicationController

  before_action :move_to_signup

  def index
  end

  private
  def move_to_signup
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
