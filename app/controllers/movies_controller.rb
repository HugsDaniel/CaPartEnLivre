class MoviesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    if params[:search].present?
      @movies = Imdb.search_movie(params[:search][:query])
    end
    @movie = Movie.new
  end

  def create
    @group = Group.find(params[:group_id])
    @movie = Movie.new(movie_params)
    @movie.imdb_url = get_imdb_url(movie_params[:tmdb_id])
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
    params.require(:movie).permit(:owner_grade, :tmdb_id, :owner_comment, :title, :overview, :original_title, :release_date, :poster_path, :genres)
  end

  def get_imdb_url(tmdb_id)
    response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")).read)

    imdb_id = response['imdb_id']

    "https://www.imdb.com/title/#{imdb_id}/"
  end
end
