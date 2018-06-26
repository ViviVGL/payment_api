# frozen_string_literal: true

class Card < ApplicationRecord
  validates :holder_name, :card_number, :expiration_date, :cvv,
            presence: true
end
