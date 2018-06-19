# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments requests', type: :request do
  let(:client) { create(:client) }
  let(:buyer) { create(:buyer) }

  describe 'POST create' do
    context 'boleto payment' do
      context 'successfully' do
        let(:payment_json) do
          { client: { id: '126' }, buyer: { name: 'Fulano',
                                            email: 'email@email.com',
                                            cpf: '111.222.333-44' },
            payment: { amount: '1000.00', type: 'Boleto' } }
        end

        it 'should return status code 201 created' do
          post '/api/payments', params: { payment: payment_json }
          expect(response.status).to eq 201
        end
      end

      context 'without amount' do
        it 'should return status code 412 precondition failed' do
          post '/api/payments', params: {
            payment: { client: client, buyer: buyer }
          }
          expect(response.status).to eq 412
        end
      end
    end
  end
end
