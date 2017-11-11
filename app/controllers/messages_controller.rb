class MessagesController < ApplicationController

  before_action :move_to_signup, except: :index

  def index
  end

  private
  def move_to_signup
    redirect_to "/users/sign_up" unless user_signed_in?
  end
end
