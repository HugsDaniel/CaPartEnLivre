class SeriesController < ApplicationController
  before_action :set_group

  def index
    @series = @group.series.where(nil).order('likes_count DESC') # creates an anonymous scope
    @series = @series.filtered(params[:series_genre]).order('likes_count DESC') if params[:series_genre].present?
  end

  def new
    if params[:search].present?
      @all_series = Imdb.search_series(params[:search][:query])
    end
    @series = Series.new
  end

  def create
    @series = Series.new(series_params)

    @series.user = current_user
    @series.group = @group
    @series.remote_poster_url = @series.poster_path

    if @series.save
      redirect_to group_series_index_path(@group), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def series_params
    permitted_params = params.require(:series).permit(:genres, :owner_grade, :owner_comment, :title, :overview, :release_date, :poster_path)
    permitted_params[:genres] = permitted_params[:genres].split(" ")
    return permitted_params
  end
end
