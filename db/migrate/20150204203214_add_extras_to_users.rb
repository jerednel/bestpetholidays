class AddExtrasToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :website, :string
  	add_column :users, :display_name, :string
  	add_column :users, :post_code, :string
  	add_column :users, :address_line_1, :string
  	add_column :users, :address_line_2, :string
  	add_column :users, :description, :text
  end
end
