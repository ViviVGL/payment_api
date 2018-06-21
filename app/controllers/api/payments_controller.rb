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
      params.require(:payment).permit(:amount, :payment_type, client: %i[id],
                                      buyer: %i[name email cpf])
    end

    def build_payment
      param = payment_params
      Payment.new(param.merge(client: client, buyer: buyer))
    end

    def client
      Client.find_by(payment_params[:client])
    end

    def buyer
      Buyer.new(payment_params[:buyer])
    end
  end
end
