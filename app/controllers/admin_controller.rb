class AdminController < ApplicationController


  def admin
    @first_contact = Contact.first
    @contacts = Contact.all
    render 'pages/admin'
  end



end
