class MessagesController < ApplicationController
  def index 
  	#@user = User.find_by(email: params[:session][:email].downcase)
  	#//if buyer
  	#@messages = Message.find_by(buyer_email_id:@user.email)
  	#
  	@messages=Message.all
  end

  def new
  	@new_message = Message.order("created_at").last
  	@new_message=Message.last
  end	

  def create
  	@message = Message.all
  end
  
end
