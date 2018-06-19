# frozen_string_literal: true

module Api
  class PaymentsController < ApplicationController
    def create
      payment = Payment.new(payment_params)
      if payment.save
        render status: :created
      else
        render status: :precondition_failed
      end
    end

    private

    def payment_params
      params.require(:payment).permit(:amount, :type, :client_id, :buyer_id)
    end
  end
end
