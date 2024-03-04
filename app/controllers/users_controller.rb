class UsersController < ApplicationController
  def all_users
    @users = User.all
    render :index
  end

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.create(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"],
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      first_name: params["first_name"] || @user.first_name,
      last_name: params["last_name"] || @user.last_name,
      email: params["email"] || @user.email,
      phone_number: params["phone_number"] || @user.phone_number,
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User successfully destroyed" }
  end
end
