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
    params = {
      captain_id: current_user.id,

    }
  end

  def update
    
  end

  def destroy
    
  end
end
