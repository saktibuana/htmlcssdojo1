class User < ApplicationRecord
	has_secure_password

	validates :fullname, presence: true
	validates :username, presence: true
	validates :password, presence: true
end
