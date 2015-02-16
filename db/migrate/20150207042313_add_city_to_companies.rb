class AddCityToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :city, :string
    add_column :companies, :pincode, :string
  end
end
