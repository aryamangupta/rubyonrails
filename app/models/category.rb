class Category < ActiveRecord::Base
	include Redis::Objects

	has_many :products

	list :text_fields
	list :dropdown_fields
	list :checkbox_fields
end
