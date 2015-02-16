class RenameSensitiveName < ActiveRecord::Migration
  def change
  	rename_column :pets, :type, :pet_type
  end
end
