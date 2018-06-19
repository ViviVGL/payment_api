class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :type
      t.references :client, foreign_key: true
      t.references :buyer, foreign_key: true
    end
  end
end
