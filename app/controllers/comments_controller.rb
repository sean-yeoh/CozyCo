class CommentsController < ApplicationController

	def create
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			redirect_to topic_path(@topic)
		else
			render 'new'
		end
	end

	def edit
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to topic_path(@topic)
		else
			render 'edit'
		end
	end

	def destroy
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@topic)
	end
end
