class User < ActiveRecord::Base
	validates :user, length: { maximum: 128 }, presence: true, uniqueness: true
	validates :password, length: { maximum: 128 }
	# validates :count
end
