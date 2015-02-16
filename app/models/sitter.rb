class Sitter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  require 'geocoder'
  extend FriendlyId
  friendly_id :display_name, use: :slugged

def should_generate_new_friendly_id?
   new_record? || slug.nil? || slug.blank? # you can add more condition here
end
  has_many :reservations
  has_many :pets
  has_many :users, through: :reservations
  validates :display_name, presence: true
  validates :post_code, presence: true
  validates :description, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	geocoded_by :post_code
	after_validation :geocode


 reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      # populate your model
      obj.city    = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country_code
    end
  end


end
