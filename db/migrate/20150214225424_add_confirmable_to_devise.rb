class AddConfirmableToDevise < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at,       :datetime
    add_column :users, :confirmation_sent_at , :datetime
    add_column :users, :unconfirmed_email, :string

    add_index  :users, :confirmation_token, :unique => true

    add_column :sitters, :confirmation_token, :string
    add_column :sitters, :confirmed_at,       :datetime
    add_column :sitters, :confirmation_sent_at , :datetime
    add_column :sitters, :unconfirmed_email, :string

    add_index  :sitters, :confirmation_token, :unique => true
  end
  def self.down
    remove_index  :users, :confirmation_token

    remove_column :users, :unconfirmed_email
    remove_column :users, :confirmation_sent_at
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_token

    remove_index  :sitters, :confirmation_token

    remove_column :sitters, :unconfirmed_email
    remove_column :sitters, :confirmation_sent_at
    remove_column :sitters, :confirmed_at
    remove_column :sitters, :confirmation_token
  end

end
