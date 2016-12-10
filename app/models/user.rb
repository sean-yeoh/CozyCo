class User < ActiveRecord::Base
  include Clearance::User
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
end
