# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    amount 1000.0
    type 'Boleto'
    client
    buyer
  end
end
