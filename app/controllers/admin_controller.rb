class AdminController < ApplicationController
  before_action :authenticate_admin!

  def admin
    @first_contact = Contact.first
    @contacts = Contact.all
    render 'pages/admin'
  end

  def authenticate_admin!
    unless current_user.admin?
      redirect_to root_path, notice: "You are not authorized to access this page"
    end
  end

end
