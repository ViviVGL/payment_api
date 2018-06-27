# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    holder_name 'Dono do cartão'
    card_number '11112222'
    expiration_date 5.years.from_now.to_date
    cvv '444'
  end
end
