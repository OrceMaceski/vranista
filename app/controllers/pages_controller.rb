# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token # fix this with the hosting provider
  def home
    @youtube = Youtube.last&.link || 'https://www.youtube.com/embed/NoK6t3zZFsU'
  end

  def about; end

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def our_team; end

  def contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
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
