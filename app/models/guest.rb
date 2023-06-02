class Guest < ApplicationRecord
	# I am assuming that one guest can book more than one reservation
	has_many :reservations  

	validates :email,uniqueness: true, presence: true

	serialize :phone#, Array
end
