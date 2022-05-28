# frozen_string_literal: true

class Youtube < ApplicationRecord
    validates :link, presence: true
end
