class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :caption
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :products
  end
end
