class ScreensController < ApplicationController
  def new
    @screen = Screen.new
  end

  def create
    @screen = Screen.new(screen_params)
    if @screen.save
      redirect_to @screen
    else
      render :new
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
  end


  def index
    @theatre = Theatre.find(params[:id])
    @screen = @theatre.screens
  rescue
    flash[:notice] = "Not found"
    redirect_to search_screen_by_theatre_path
  end

  def destroy
    @screen = @current_user.screens.find(params[:id])
    @screen.destroy
    redirect_to screens_path
  end

  private

  def screen_params
    params.require(:screen).permit(:seating_capacity, :theatre_id, :movie_id)
  end
end
