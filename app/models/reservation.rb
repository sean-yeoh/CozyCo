class Reservation < ActiveRecord::Base
	has_many :confirmations
	belongs_to :listing

end
