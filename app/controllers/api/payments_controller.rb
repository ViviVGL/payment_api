# frozen_string_literal: true

module Api
  class PaymentsController < ApplicationController
    def create
      payment = build_payment
      if payment.save
        render status: :created
      else
        render status: :precondition_failed
      end
    end

    private

    def payment_params
      params.require(:payment).permit(:amount, :payment_type,
                                      client: %i[id],
                                      buyer: %i[name email cpf],
                                      card: %i[holder_name card_number
                                               expiration_date cvv])
    end

    def build_payment
      param = payment_params
      return merge_all_params(param) if credit_card
      merge_only_client_buyer(param)
    end

    def client
      Client.find_by(payment_params[:client])
    end

    def buyer
      Buyer.new(payment_params[:buyer])
    end

    def card
      Card.new(payment_params[:card])
    end

    def credit_card
      payment_params[:payment_type] == 'Credit Card'
    end

    def merge_all_params(param)
      Payment.new(param.merge(client: client, buyer: buyer, card: card))
    end

    def merge_only_client_buyer(param)
      Payment.new(param.merge(client: client, buyer: buyer))
    end
  end
end
