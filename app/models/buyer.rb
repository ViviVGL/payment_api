# frozen_string_literal: true

class Buyer < ApplicationRecord
  validates :name, :email, presence: true
end
