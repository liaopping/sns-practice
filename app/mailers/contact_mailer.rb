class ContactMailer < ApplicationMailer
  default from: 'admin@example.com'

  def received_email(contact)
    @contact = contact
    mail(
      to: 'admin@example.com',
      subject: 'お問い合わせがありました'
    )
  end

  def sent_email(contact)
    @contact = contact
    mail(
      to: @contact.email,
      subject: 'お問い合わせを受け付けました'
    )
  end

end
