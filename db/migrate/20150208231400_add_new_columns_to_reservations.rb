class AddNewColumnsToReservations < ActiveRecord::Migration
  def up
    add_column :reservations, :start_at, :datetime
    add_column :reservations, :end_at, :datetime

    puts 'Updating correctly named columns'
    execute "UPDATE reservations SET start_at = res_start_date, end_at = res_end_date"

  end

  def down
    remove_column :reservations, :start_at
    remove_column :reservations, :end_at
  end
end
