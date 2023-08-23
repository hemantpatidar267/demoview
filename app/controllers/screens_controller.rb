class ScreensController < ApplicationController
  def new
    @screen = Screen.new
  end

  def create
    @screen = Screen.new(screen_params)
    if @screen.save
      redirect_to @screen
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @screen = Screen.find(params[:id])
  end

  def edit
    @screen = Screen.find(params[:id])
  end

  def update
    @screen = @current_user.screens.find(params[:id])
    if @screen.update(screen_params)
      redirect_to @screen
    else
      render :edit
    end
  end

  def search_screen_by_theatre
    @theatre = Theatre.find(params[:id])
    @screen = @theatre.screens
    raise if @screen.empty?
  rescue
    flash[:notice] = "Not found"
    redirect_to screens_path
  end


  def index
    @screen = Screen.all
  end

  def destroy

    @screen = @current_user.screens.find_by_id(params[:id])
    @screen.destroy
    redirect_to screens_path
  rescue
    flash[:notice] = "you cant delete this screen"
    redirect_to screen_path

  end

  private

  def screen_params
    params.require(:screen).permit(:seating_capacity, :theatre_id, :movie_id)
  end
end
