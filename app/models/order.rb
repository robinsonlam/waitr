# == Schema Information
#
# Table name: orders
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  total    :float
#  progress :text             default("Processing")
#

class Order < ActiveRecord::Base
	has_and_belongs_to_many :items
	belongs_to :user
	enum progress: { :Processing => 1, :Cooking => 2, :Complete => 3 }

	def class_for_progress(order)
		case order.progress
			when 'Processing'
			  'processing'
			when 'Complete'
			  'complete'
			when 'Cooking'
			  'cooking'
		end
	end
end
