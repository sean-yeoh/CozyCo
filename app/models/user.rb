class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts
  has_many :comments
  has_many :credits
end
