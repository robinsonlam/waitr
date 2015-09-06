# == Schema Information
#
# Table name: items
#
#  id    :integer          not null, primary key
#  name  :text
#  price :float
#  image :text
#

class Item < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :orders
end
