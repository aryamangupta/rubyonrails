class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :business_type
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
