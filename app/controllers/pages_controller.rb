class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home homme contactus pricing who_we_are what_we_do]

  def home
  end

  def contact
  end

  def contactus
    @contact = Contact.new
  end

end
