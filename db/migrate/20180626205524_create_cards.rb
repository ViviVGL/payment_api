class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :holder_name
      t.string :card_number
      t.date :expiration_date
      t.string :cvv
    end
  end
end
