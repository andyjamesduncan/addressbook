class EmailsController < ApplicationController
	def new
		@contact = Contact.find params[:contact_id]
		@email = @contact.emails.new
	end
	def create
		@contact = Contact.find params[:contact_id]
		@email = @contact.emails.new email_params

		if @email.save
			redirect_to action: 'show', controller:'contacts', id: @contact.id
		else
	 		render 'new'
	 	end
	end

	def edit
 		@contact = Contact.find params[:contact_id]
 		@email = @contact.emails.find params[:id]
 	end

	def update
		@contact = Contact.find params[:contact_id]
		@email = Email.find(params[:id])
		if @email.update_attributes email_params
	 		flash[:notice] = "Email updated successfully"
	 		redirect_to action: 'show', controller:'contacts', id: @contact.id
	 	else
	 		flash.now[:errors] = @email.errors.full_messages
	 		render 'edit'
	 	end
 	end

 	def destroy
		@contact = Contact.find params[:contact_id]
		@email = Email.find(params[:id])
		if @email.destroy
	 		flash[:notice] = "Email deleted successfully"
	 	else
	 		flash.now[:errors] = @email.errors.full_messages
	 	end
	 	redirect_to action: 'show', controller:'contacts', id: @contact.id
 	end

	private

	def email_params
		params.require(:email).permit(:email_address)
	end
end
