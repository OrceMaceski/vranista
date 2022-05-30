# frozen_string_literal: true

class Video < ApplicationRecord
  before_save :convert_to_embeded
  validates :link, presence: true

  def convert_to_embeded
    link.gsub!('watch?v=', 'embed/') if link.include?('watch?v=')
  end
end
