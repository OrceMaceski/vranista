# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @youtube = Youtube.last.link || 'https://www.youtube.com/embed/FMJQKx8OWIU'
  end

  def about; end

  def our_team; end

  def contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: t('message.sent')
    else
      render :contact, alert: t('alert.sent')
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
