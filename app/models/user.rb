# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  first_name      :text
#  last_name       :text
#  image           :text             default("http://www.gravatar.com/avatar/?d=mm")
#  password_digest :text
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
	has_secure_password
	
	has_and_belongs_to_many :items
	has_many :orders

	validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }
end
