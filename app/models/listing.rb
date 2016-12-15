class Listing < ActiveRecord::Base
	has_many :reservations
end
