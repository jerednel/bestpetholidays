class Pet < ActiveRecord::Base
	belongs_to :sitter
	has_and_belongs_to_many :reservations
end
