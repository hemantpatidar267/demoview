class UsersController < ApplicationController
  before_action :authenticate_user, except: [:wellcome, :new, :create]
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def wellcome

  end

  def front
    # @current_user
    @movie = Movie.all
  end

  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    # debugger
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      puts @user.errors.full_messages
      render :edit
    end
  end



  def destroy
    @user = User.find(params[:id])
    if @user.id == @current_user.id
      @user.destroy
      redirect_to root_path
    else
      flash[:notice] = 'You are not authorized'
      redirect_to  users_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
