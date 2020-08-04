class TopicsController < ApplicationController
  def follow
    follower = current_user.topic_followers.build(topic_id: params[:id])
    if follower.save
      redirect_to root_path, notice: "Followed successfully!"
    else
      redirect_to root_path, alert: follower.errors.full_messages
    end
  end
end
