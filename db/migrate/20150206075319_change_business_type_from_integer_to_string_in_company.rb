class ChangeBusinessTypeFromIntegerToStringInCompany < ActiveRecord::Migration
  def change
    change_column :companies, :business_type, :string
  end
end
