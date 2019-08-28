class SeriesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    if params[:search].present?
      @series = Imdb.search_series(params[:search][:query])
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @series = Series.new(series_params)
    @series.user = current_user
    @series.group = @group
    @series.remote_poster_url = @series.poster_path

    if @series.save
      redirect_to group_path(@group), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def series_params
    params.require(:series).permit(:title, :overview, :release_date, :poster_path)
  end
end
