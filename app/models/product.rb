class Product < ActiveRecord::Base
  include Redis::Objects
  has_many :pictures

  belongs_to :company
  belongs_to :category
  
  hash_key :specifications
end
