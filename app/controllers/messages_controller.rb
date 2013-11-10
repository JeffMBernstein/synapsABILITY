class MessagesController < ApplicationController

  before_action :require_current_user
  
	def index
  	@messages = Message.all
    @message = Message.new 
  end

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)
    if @message.save
      redirect_to user_path(@current_user)
    else
      render action: :new
    end
  end

  def show
  	@message = Message.find(params[:id])
  end


  private
  def message_params
  	params.require(:message).permit(:subject, :body, :sender_id, :recipient_id)
  end

end

