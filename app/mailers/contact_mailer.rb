class ContactMailer < ApplicationMailer
  default to: "stuart@viddex.io"

  def contact_submission(contact)
    @contact = contact
    mail(subject: "New Contact Submission")
  end

end
