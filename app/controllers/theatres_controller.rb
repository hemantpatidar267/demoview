class TheatresController < ApplicationController

  def index
    if @current_user.role == 'owner'
      @theatre= @current_user.theatres
    else
      @theatre = Theatre.all
    end
  end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre = @current_user.theatres.new(theatre_params)
    if @theatre.save
      redirect_to @theatre
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @theatre= Theatre.find(params[:id])
  end

  def edit
    @theatre = Theatre.find(params[:id])
  end

  def update
    @theatre = @current_user.theatres.find(params[:id])
    if @theatre.update(theatre_params)
      redirect_to @theatre
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search_theatre_by_movie
    @screen =Screen.where(movie_id: params[:id])
    raise if @screen.empty?
  rescue
    flash[:notice] = "Not found"
    redirect_to theatres_path
  end


  private

  def theatre_params
    params.require(:theatre).permit(:name, :address)
  end
end
