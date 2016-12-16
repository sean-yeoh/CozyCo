class ConversationsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation

    if conversation
      flash[:notice] = "Your message was successfully sent!"
      redirect_to conversation_path(conversation)
    else
      flash[:alert] = "Your message can't be sent."
      render 'new'
    end
  end

  def new_private_message
    @chosen_recipient = User.find(params[:id])
    render 'conversations/new_private_message'
  end

  # def create_private_message
  #   recipient = User.find(params[:id])
  #   conversation = current_user.send_message(recipient, conversation_params[:body], conversation_params[:subject]).conversation

  #   if conversation
  #     flash[:notice] = "Your message was successfully sent!"
  #     redirect_to conversation_path(conversation)
  #   else
  #     flash[:alert] = "Your message can't be sent"
  #     render 'new'
  #   end
  # end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
end