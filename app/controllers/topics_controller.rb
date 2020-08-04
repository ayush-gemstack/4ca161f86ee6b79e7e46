class TopicsController < ApplicationController
  def follow
    follower = current_user.topic_followers.build(topic_id: params[:id])
    if follower.save
      redirect_to root_path, notice: "Followed successfully!"
    else
      redirect_to root_path, alert: follower.errors.full_messages
    end
  end

  def new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to questions_path
    else
      redirect_to questions_path, alert: @topic.errors.full_messages
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:topic)
  end
end
