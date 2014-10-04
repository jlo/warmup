class User < ActiveRecord::Base
	validates :user, length: { maximum: 128 }, presence: true, uniqueness: true
	validates :password, length: { maximum: 128 }
	# validates :count
	def self.authenticate(user, password)
    	user = find_by_user(user)
    	if user
      		user
    	else
      		nil
    	end
  	end
end
