class CreateReservationsPetsJoinTable < ActiveRecord::Migration
  def change
  	create_table :pets_reservations, id: false do |t|
  		t.belongs_to :pet, index: true
  		t.belongs_to :reservation, index: true
  	end
  end
end
