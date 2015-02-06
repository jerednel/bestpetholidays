class AddFieldsToSitter < ActiveRecord::Migration
  def change
  	add_column :sitters, :website, :string
  	add_column :sitters, :display_name, :string
  	add_column :sitters, :post_code, :string
  	add_column :sitters, :address_line_1, :string
  	add_column :sitters, :address_line_2, :string
  	add_column :sitters, :description, :text
  end
end
