class MoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(4)
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html {redirect_to movies_path, notice: 'Movie has been created'}
        format.js {}
        format.json {render json: @movie, status: :created, location: @movie}
      else
        format.html {render action: "new"}
        format.json {render json: @movie.error, status: :unprocessable_entity}
      end
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "#{@movie.title} was deleted!"
  end

  protected

    def movie_params
      params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :image, :release_date)
    end

end
