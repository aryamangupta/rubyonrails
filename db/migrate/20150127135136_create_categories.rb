class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :subsubcategory
      t.text :subcategory
      t.text :category

      t.timestamps null: false
    end
  end
end
