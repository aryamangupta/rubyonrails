class DropAddressInfoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :state
    remove_column :users, :company
    remove_column :users, :country
    remove_column :users, :contact_number
  end
end
