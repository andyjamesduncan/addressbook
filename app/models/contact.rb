class Contact < ActiveRecord::Base

	has_many :emails
	has_many :phones
	
	validates :name, presence: true, uniqueness: true, length: {maximum: 50}
	validates :address, presence: true

end