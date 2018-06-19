# frozen_string_literal: true

class Payment < ApplicationRecord
  validates :amount, :type, presence: true
end
