class Api::FriendshipsController < ApplicationController
  def create
    friend = Friendship.new(user_id: current_user.id, friend_id: params[:id])
    friend.save
    redirect_to "/api/users/#{current_user.id}"
  end

  def destroy
    
  end
end
