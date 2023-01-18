class ContactsController < ApplicationController
  before_action :set_contact, only: [:new]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Success. We will get back to you as soon as possible!."
      redirect_to '/contacts/new'
    else
      flash[:alert] = "Unsuccessful. Please try again.."
      redirect_to :new
    end
  end

  private

  def set_contact
    @contact = Contact.new
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :notes, :country, :job_title)
  end
end
