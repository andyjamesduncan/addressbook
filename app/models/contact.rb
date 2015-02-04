class Contact < ActiveRecord::Base

	has_many :emails, dependent: :delete_all
	has_many :phones, dependent: :delete_all

	validates :name, presence: true, uniqueness: true, length: {maximum: 50}
	validates :address, presence: true

end