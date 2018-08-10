class Api::UsersController < ApplicationController
  def show
    @user = current_user
    render "show.json.jbuilder"
  end

  def index
    @users = User.all
    render "index.json.jbuilder"
  end

  def create
    @user = User.new(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      age: params[:age],
      height: params[:height],
      weight: params[:weight],
      city: params[:city],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
