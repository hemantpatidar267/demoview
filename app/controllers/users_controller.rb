class UsersController < ApplicationController
  skip_before_action :authenticate_user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def wellcome
  end

  def customer
  end

  def owner
  end

  def show
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = @current_user
    @user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
