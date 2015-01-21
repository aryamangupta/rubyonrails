class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :ProductName
      t.text :ProductKeyword
      t.integer :ProductCategoryId
      t.integer :ProductSubCategory
      t.integer :ProductCategorization
      t.text :ModelNo
      t.text :BrandName
      t.text :MoreDetails
      t.text :MinimumOrder
      t.text :SupplyAbility
      t.text :QuotedPrice
      t.text :PaymentTerms
      t.text :DeliveryTime
      t.text :PackagingDetails
      t.text :DetailedDesciption
      t.text :Approved

      t.timestamps null: false
    end
  end
end
