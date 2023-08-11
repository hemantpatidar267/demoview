class UsersController < ApplicationController
  skip_before_action :authenticate_user
  def create
    @current_user = User.new(user_params)
    if @current_user.save
      redirect_to @current_user
    else
      render :new
    end
  end

  def new
    @current_user = User.new
  end

  def wellcome
  end

  def customer
  end

  def owner
  end

  def show
    @current_user = User.find(params[:id])
  end

  def update
    @current_user = User.find(params[:id])
    if @current_user.update(user_params)
      redirect_to @current_user
    else
      render :edit
    end
  end

  def edit
    @current_user = User.find(params[:id])
  end

  def destroy
    @current_user = User.find(params[:id])
    @current_user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
