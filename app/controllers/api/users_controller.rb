class Api::UsersController < ApplicationController
  def show
    @user = current_user
    render "show.json.jbuilder"
  end

  def index
    @users = User.where.not(id: current_user.id)
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

  def update
    user_id = current_user.id
    @user = User.find_by(id: user_id)
    @user.username = params[:username] || @user.username
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.age = params[:age] || @user.age
    @user.height = params[:height] || @user.height
    @user.weight = params[:weight] || @user.weight
    @user.city = params[:city] || @user.city
    @user.email = params[:email] || @user.email

    if @user.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.fullmessages}, status: :unprocessable_entity
    end
  end

  def destroy
    
  end
end
