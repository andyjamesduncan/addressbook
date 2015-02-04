class AddContactIdToEmailsAndPhones < ActiveRecord::Migration
  def change
	add_column :emails, :contact_id, :integer
	add_column :phones, :contact_id, :integer
  end
end
