class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    render :index
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.with(name: @contact.name, email: @contact.email, body: @contact.body).received_email(@contact).deliver_now
      ContactMailer.with(name: @contact.name, email: @contact.email, body: @contact.body).sent_email(@contact).deliver_now
      render :thanks
    else
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
