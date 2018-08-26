class Api::CaptainsController < ApplicationController
  def create
    # create action occurs in fit_group_controller

    # p params
    # fit_group = current_user.fit_groups.find_by(status: 'Pending')
    # p "*" * 50
    # p fit_group
    # p "*" * 50
    # fit_group_id = fit_group.id
    # fit_group = FitGroup.find_by(id: fit_group_id)
    # fit_group.status = 'Active'
    # fit_group.captain_id = @captain.id
    # fit_group.save

    # redirect_to "/api/user_fit_groups"
  end

  def show
    @captain = Captain.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def index
    @captains = Captain.all
    render "index.json.jbuilder"
  end
end
