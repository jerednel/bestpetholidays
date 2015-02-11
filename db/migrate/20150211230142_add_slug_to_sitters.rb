class AddSlugToSitters < ActiveRecord::Migration
  def change
  	add_column :sitters, :slug, :string
  	add_index :sitters, :slug, unique: true
  end
end
