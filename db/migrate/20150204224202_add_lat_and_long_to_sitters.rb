class AddLatAndLongToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :latitude, :float
    add_column :sitters, :longitude, :float
  end
end
