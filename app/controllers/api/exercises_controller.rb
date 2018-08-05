class Api::ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    render 'index.json.jbuilder'
  end

  def show
    @exercise = Exercise.find(params[:id])
    render 'show.json.jbuilder'
  end
end
