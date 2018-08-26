class Api::UserFitGroupsController < ApplicationController
  def create
    # create occurs in fit_group_controller

    # user_fit_group = UserFitGroup.new(
    #   {
    #     user_id: current_user.id,
    #     fit_group_id: FitGroup.find_by(captain_id: Captain.find_by(user_id: current_user.id))
    #   }
    # )
    # p "*" * 50
    # p user_fit_group
    # p "*" * 50
    # user_fit_group.save
    # fit_group = current_user.fit_groups.where(status: 'Pending')
    # fit_group.status = 'Active'
    # redirect_to "/api/fit_groups"
  end
end
