class AddCompanyIdToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :company, index: true
    add_foreign_key :products, :companies
  end
end
