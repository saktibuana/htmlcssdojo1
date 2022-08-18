class Contest < ApplicationRecord
	has_many :contestants
	has_many :users, :through => :contestants
end
