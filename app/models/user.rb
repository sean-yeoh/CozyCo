class User < ActiveRecord::Base
  include Clearance::User
  has_many :events_attendees
  has_many :topics
  has_many :comments
  has_many :credits
  has_many :events
  has_many :listings
  has_many :reservations
  mount_uploader :photo, PhotoUploader
  # require 'mailboxer'
  # include Mailboxer::Models::Messageable
  extend Mailboxer::Models::Messageable::ActiveRecordExtension

  acts_as_messageable

  def mailboxer_name
    self.email
  end

  def mailboxer_email(object)
    self.email
  end

  def credit_balance?
    if Credit.find_by(user_id: self.id).nil?
      return "0.00"
    else
      record = Credit.find_by(user_id: self.id)
      amount = record.amount
      cents = record.cents
      return "#{amount}.#{cents}"
    end
  end

  enum role: [:resident, :administrator, :super_admin]

end
