class Sitter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :reservations
  has_many :users, through: :reservations
  validates :display_name, presence: true
  validates :post_code, presence: true
  validates :description, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	geocoded_by :post_code
	after_validation :geocode

end
