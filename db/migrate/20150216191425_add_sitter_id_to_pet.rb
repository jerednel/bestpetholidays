class AddSitterIdToPet < ActiveRecord::Migration
  def change
  	add_column :pets, :sitter_id, :integer
  end
end
