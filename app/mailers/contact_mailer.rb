class ContactMailer < ApplicationMailer
  def contact_email(message)
    @message = message
    mail(to: ENV['GMAIL_ADDRESS'], subject: 'New Contact Submission')
  end
end
