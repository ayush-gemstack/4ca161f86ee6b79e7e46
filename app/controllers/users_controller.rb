class UsersController < ApplicationController
  def follow
    follower = current_user.user_followers.build(follower_id: params[:id])
    if follower.save
      redirect_to root_path, notice: "Followed successfully!"
    else
      redirect_to root_path, alert: follower.errors.full_messages
    end
  end
end
