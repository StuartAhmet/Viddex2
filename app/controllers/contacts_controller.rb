class ContactsController < ApplicationController
  before_action :set_contact, only: [:new]

  def new
    @contact = Contact.new
    @selected_contact = Contact.find_by(id: params[:id]) || Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Thankyou for getting in contact with us. We will get back to you via your email as soon as possible!"
      redirect_to '/contactus'
    else
      flash[:alert] = "Unsuccessful. Please try again.."
      redirect_to :new
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if params[:read] == "true"
      if @contact.update(read: true)
        render json: { success: 'Contact read attribute updated' }, status: :ok
      else
        render json: { error: @contact.errors }, status: :unprocessable_entity
      end
    elsif params[:read] == "false"
      if @contact.update(read: false)
        render json: { success: 'Contact read attribute updated' }, status: :ok
      else
        render json: { error: @contact.errors }, status: :unprocessable_entity
      end
    else
      render json: { error: "Invalid value for read attribute" }, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  private

  def set_contact
    @contact = Contact.new
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :notes, :country, :job_title)
  end
end
