class Reservation < ActiveRecord::Base
	has_many :confirmations
	belongs_to :listing
  belongs_to :user
end
