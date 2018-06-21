# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :client
  belongs_to :buyer
  validates :amount, :payment_type, presence: true
end
