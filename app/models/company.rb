class Company < ActiveRecord::Base
  has_many :users
  has_many :products

  accepts_nested_attributes_for :users

  validates :name, presence: true
  validates :business_type, presence: true
end
