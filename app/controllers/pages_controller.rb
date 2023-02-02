class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home contactus]

  def home
  end

  def contact
  end

  def contactus
    @contact = Contact.new
  end

end
