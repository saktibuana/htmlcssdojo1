class History < ApplicationRecord

	validates :title, presence: true
	validates :desc, presence: true
	validates :incident_date, presence: true

	def user
		return User.find_by(id: self.post_by)
	end
end
