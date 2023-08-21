class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = @current_user.movies.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = @current_user.movies.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def available_movie
    @movie = Movie.where('start_date <= ? AND end_date >= ?', Date.today, Date.today)
  end

  def index
    query = params[:query]
    @movie = Movie.where('name LIKE ?', "%#{query}%")
    raise if @movie.empty?
  rescue
    flash[:notice] = "Not found"
    redirect_to available_movie_path

  end

  private

  def movie_params
    params.require(:movie).permit(:name, :start_date, :end_date)
  end
end
