class Email < ActiveRecord::Base
	belongs_to :contact

	validates :email_address, 
						presence: true, 
						uniqueness: true, 
						length: {maximum: 80}, 
						format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
