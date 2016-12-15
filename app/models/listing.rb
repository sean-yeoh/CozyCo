class Listing < ActiveRecord::Base
	has_many :reservations

  belongs_to :user
  belongs_to :listing_type

  scope :listing_type_id, -> (listing_type_id) { where listing_type_id: listing_type_id }

end
