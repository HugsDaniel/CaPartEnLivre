class MoviesController < ApplicationController
  before_action :set_group

  def index
    @movies = @group.movies.where(nil).order('likes_count DESC') # creates an anonymous scope
    @movies = @movies.filtered(params[:movie_genre]).order('likes_count DESC') if params[:movie_genre].present?
  end

  def new
    if params[:search].present?
      @movies = Imdb.search_movie(params[:search][:query])
    end
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    @movie.imdb_url = get_imdb_url(movie_params[:tmdb_id])
    @movie.user = current_user
    @movie.group = @group
    @movie.remote_poster_url = @movie.poster_path

    if @movie.save
      redirect_to group_movies_path(@group), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def movie_params
    permitted_params = params.require(:movie).permit(:owner_grade, :tmdb_id, :owner_comment, :title, :overview, :original_title, :release_date, :poster_path, :genres)
    permitted_params[:genres] = permitted_params[:genres].split(" ")
    return permitted_params
  end

  def get_imdb_url(tmdb_id)
    begin
      response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")).read)
    rescue OpenURI::HTTPError
      return
    end

    imdb_id = response['imdb_id']

    "https://www.imdb.com/title/#{imdb_id}/"
  end
end
