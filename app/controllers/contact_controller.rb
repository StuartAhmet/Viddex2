class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new

    if @message.valid?
      ContactMailer.contact_email(@message).deliver.now
      redirect_to new_contact_path, notice: "Thanks for your message. We will be in touch soon!"
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :description)
  end
end
