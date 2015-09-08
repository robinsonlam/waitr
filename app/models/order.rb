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
	enum progress: { processing: 1, cooking: 2, complete: 3 }

	def class_for_progress(order)
		case order.progress
			when 'processing'
			  'processing'
			when 'complete'
			  'complete'
			when 'cooking'
			  'cooking'
		end
	end
end
