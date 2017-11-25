class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(params[:group_id])}
        format.json
      end
    else
      flash[:alert] = "メッセージの保存に失敗しました"
      redirect_to group_messages_path(params[:group_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
