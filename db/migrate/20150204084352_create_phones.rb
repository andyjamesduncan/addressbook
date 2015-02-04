class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
	t.string :telephone_number
      t.timestamps null: false
    end
  end
end
