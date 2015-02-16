class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :type
      t.string :b
      t.string :breed
      t.string :name
      t.text :summary

      t.timestamps
    end
  end
end
