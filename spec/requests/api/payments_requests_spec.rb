# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments requests', type: :request do
  let(:client) { create(:client) }
  let(:buyer) { create(:buyer) }
  let(:card) { create(:card) }

  describe 'POST create' do
    context 'boleto payment' do
      context 'successfully' do
        let(:payment_json) do
          { client: { id: client.id }, buyer: { name: buyer.name,
                                                email: buyer.email,
                                                cpf: buyer.cpf },
            amount: '1000.00', payment_type: 'Boleto' }
        end

        it 'should return status code 201 created' do
          post '/api/payments', params: { payment: payment_json }
          expect(response.status).to eq 201
        end
      end

      context 'without amount' do
        let(:payment_json) do
          { client: { id: client.id }, buyer: { name: buyer.name,
                                                email: buyer.email,
                                                cpf: buyer.cpf },
            payment_type: 'Boleto' }
        end

        it 'should return status code 412 precondition failed' do
          post '/api/payments', params: { payment: payment_json }
          expect(response.status).to eq 412
        end
      end

      context 'without payment_type' do
        let(:payment_json) do
          { client: { id: client.id }, buyer: { name: buyer.name,
                                                email: buyer.email,
                                                cpf: buyer.cpf },
            amount: '1000.00' }
        end

        it 'should return status code 412 precondition failed' do
          post '/api/payments', params: { payment: payment_json }
          expect(response.status).to eq 412
        end
      end
    end

    context 'credit card payment' do
      context 'successfully' do
        let(:payment_json) do
          { client: { id: client.id }, buyer: { name: buyer.name,
                                                email: buyer.email,
                                                cpf: buyer.cpf },
            card: { holder_name: card.holder_name,
                    card_number: card.card_number,
                    expiration_date: card.expiration_date, cvv: card.cvv },
            amount: '1000.00', payment_type: 'Credit Card' }
        end

        it 'should return status code 201 created' do
          post '/api/payments', params: { payment: payment_json }
          expect(response.status).to eq 201
        end
      end
    end
  end
end
