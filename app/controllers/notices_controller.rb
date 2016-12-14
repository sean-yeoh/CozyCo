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
    if @notice.save
      redirect_to notices_path
    else
      render 'new'
    end
  end

  def edit
    @notice = Notice.find(params[:id])
    render 'edit'
  end

  def update
    @notice = Notice.find(params[:id])
     if @notice.update!(notice_params)
       redirect_to notices_path
     else
       render 'edit'
     end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to notices_path
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :body, :user_id, :expiry_date)
  end

end
