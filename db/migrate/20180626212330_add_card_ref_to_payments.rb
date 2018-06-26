class AddCardRefToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :card, foreign_key: true
  end
end
