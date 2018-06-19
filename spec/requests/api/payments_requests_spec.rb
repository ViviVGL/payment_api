# fronzen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments requests', type: :request do
  describe 'POST create payment' do
    context 'boleto payment' do
      context 'successfully' do
        before do
          post '/api/payments', params: { client: client, buyer: buyer, information: information }
        end

        it 'should return status code 201 created' do
          expect(response.status).to eq 201
        end
      end
    end

    context 'credit card payment' do
      context 'successfully' do
        before do
          post '/api/payments', params: { client: client, buyer: buyer, information: information, card: card }
        end

        it 'should return status code 201 created' do
          expect(response.status).to eq 201
        end
      end
    end
  end
end
