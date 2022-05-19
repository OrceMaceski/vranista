# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def about; end

  def contact
  end
  @contact = Contact.new

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: 'Message sent!'
    else
      render :contact, alert: 'Error sending message.'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
