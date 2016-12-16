class WelcomeController < ApplicationController

  def index
    @events = Event.all.limit(3)
    @notices = Notice.all.limit(3)
    @topics = Topic.all.limit(3)
  end
end
