class Api::FitGroupsController < ApplicationController
  def index
    @fit_groups = FitGroup.all
    render "index.json.jbuilder"
  end

  def show
    @fit_group = FitGroup.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    p "*" * 50
    p params
    p "*" * 50
    fit_group_params = {
      name: params[:name],
      status: 'Pending',
    }
    @fit_group = FitGroup.new(fit_group_params)
    @fit_group.save

    # Captain create action
    if Captain.find_by(user_id: current_user.id)
      captain = Captain.find_by(user_id: current_user.id)
    else
      captain = Captain.new(user_id: current_user.id)
      captain.save
    end

    @fit_group.captain_id = captain.id
    @fit_group.save

    # UserFitGroup create action

    user_fit_group = UserFitGroup.new(user_id: current_user.id, fit_group_id: @fit_group.id)
    user_fit_group.save

    @fit_group.status = 'Active'
    @fit_group.save

    render "show.json.jbuilder"
  end

  def update
    
  end

  def destroy
    
  end
end
