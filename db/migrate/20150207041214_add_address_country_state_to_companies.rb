class AddAddressCountryStateToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :address, :string
    add_column :companies, :state, :string
    add_column :companies, :country, :string
  end
end
