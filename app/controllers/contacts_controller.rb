class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end
	def index
		@all_contacts = Contact.all.order("name DESC")
	end
	def create
		@contact = Contact.new contact_params

		if @contact.save
 			redirect_to contacts_path
 		else
 			render 'new'
 		end
	end
	def show
		@contact = Contact.find(params[:id])

		@emails = @contact.emails
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :address)
	end
end
