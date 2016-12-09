class NoticesController < ApplicationController
  def index
    @notices = Notice.all 
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.user_id = current_user.id
    @notice.save
    redirect_to notices_index_path
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :body, :user_id, :expiry_date)
  end

end
