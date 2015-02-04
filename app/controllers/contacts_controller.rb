class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end
	def index
		@all_contacts = Contact.all.order("name ASC")
	end
	def create
		@contact = Contact.new contact_params

		if @contact.save
			flash[:notice] = "Contact created successfully"
 			redirect_to contacts_path
 		else
 			flash.now[:errors] = @contact.errors.full_messages
 			render 'new'
 		end
	end
	def show
		@contact = Contact.find(params[:id])
	end

	def edit
 		@contact = Contact.find params[:id]
 	end

	def update
		@contact = Contact.find params[:id]
		if @contact.update_attributes contact_params
	 		flash[:notice] = "Contact updated successfully"
	 		redirect_to action: 'show', controller:'contacts', id: @contact.id
	 	else
	 		flash.now[:errors] = @contact.errors.full_messages
	 		render 'edit'
	 	end
 	end

 	def destroy
		@contact = Contact.find params[:id]
		if @contact.destroy
	 		flash[:notice] = "Contact deleted successfully"
	 	else
	 		flash.now[:errors] = @contact.errors.full_messages
	 	end
	 	redirect_to action: 'index', controller:'contacts'
 	end

	private

	def contact_params
		params.require(:contact).permit(:name, :address)
	end
end
