class Topic < ActiveRecord::Base
	belongs_to :forum
	has_many :posts, :dependent => :destroy
end
