class AddRateToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :rate, :float
  end
end
