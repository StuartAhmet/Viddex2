class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home contact]

  def home
  end

  def contact
  end

  def contactus
    @contact = Contact.new
  end

end
