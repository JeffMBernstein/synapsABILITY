class MessagesController < ApplicationController
	def index
  	@messages = Message.all
  end

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)
  end

  def show
  	@message = Message.find(params[:id])
  end


private

  def message_params
  	params.require(:message).permit(:subject, :body)
  end
end


end
