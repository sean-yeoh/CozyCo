class TopicsController < ApplicationController
	before_action :require_login

	def index
		@topics = Topic.all.order("created_at DESC")
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = current_user.topics.build(topic_params)

		if @topic.save
			redirect_to @topic
		else
			render 'new'
		end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update(topic_params)
			redirect_to @topic
		else
			render 'edit'
		end
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		redirect_to root_path
	end

	private

	def find_topic
		@topic = Topic.find(params[:id])
	end

	def topic_params
		params.require(:topic).permit(:name, :content)
	end
end

