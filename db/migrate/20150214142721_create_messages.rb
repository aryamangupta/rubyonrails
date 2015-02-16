class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :buyer_email_id
      t.integer :seller_company_id
      t.string :seller_company_name
      t.integer :message_id
      t.string :product_name
      t.float :quantity
      t.text :comments

      t.timestamps null: false
    end
  end
end
