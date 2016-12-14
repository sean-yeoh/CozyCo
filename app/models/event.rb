class Event < ActiveRecord::Base
  belongs_to :user
  has_many :event_attendees
  default_scope {order(created_at: :desc)}

end
