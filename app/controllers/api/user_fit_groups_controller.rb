class Api::UserFitGroupsController < ApplicationController
  def create
    # create also occurs in fit_group_controller during Fit Group Creation process

    user_fit_group = UserFitGroup.new(
      {
        user_id: current_user.id,
        fit_group_id: params[:fit_group_id]
      }
    )
    user_fit_group.save
    redirect_to "/api/users/#{current_user.id}"
    # fit_group = current_user.fit_groups.where(status: 'Pending')
    # fit_group.status = 'Active'
    # redirect_to "/api/fit_groups"
  end
end
