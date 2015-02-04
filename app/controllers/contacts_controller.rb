class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end
	def list
		@all_contacts = Contact.all.order("name DESC")
	end
	def create
		@contact = Contact.new entry_params

		if @contact.save
 			redirect_to action: 'show', controller: 'contacts'
 		else
 			render 'new'
 		end
	end

	private

	def entry_params
		params.require(:contact).permit(:name, :address)
	end
end
