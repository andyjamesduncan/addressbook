class Contact < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, length: {maximum: 50}
	validates :address, presence: true

end