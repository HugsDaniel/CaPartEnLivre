class MoviesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    if params[:search].present?
      @movies = Imdb.search_movie(params[:search][:query])
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    @movie.group = @group
    @movie.remote_poster_url = @movie.poster_path

    if @movie.save
      redirect_to group_path(id: @group, previous: "movie"), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :original_title, :release_date, :poster_path)
  end
end
