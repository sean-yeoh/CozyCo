class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  default_scope {order(created_at: :desc)}

end
