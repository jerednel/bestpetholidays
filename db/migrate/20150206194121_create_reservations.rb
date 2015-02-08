class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :res_status
      t.integer :user_id
      t.integer :sitter_id
      t.text :res_details
      t.float :res_price
      t.date :res_start_date
      t.date :res_end_date

      t.timestamps
    end
  end
end
