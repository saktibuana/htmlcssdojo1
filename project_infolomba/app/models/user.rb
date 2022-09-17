class User < ApplicationRecord
	has_many :contestants
	has_many :contests, :through => :contestants

	has_many :winners
	has_many :contests, :through => :winners

end
