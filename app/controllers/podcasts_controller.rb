class PodcastsController < ApplicationController
  before_action :set_group, only: [:index, :new, :create]

  def index
    @podcasts = @group.podcasts.where(nil).order('likes_count DESC') # creates an anonymous scope
    @podcasts = @podcasts.filtered(params[:book_genre]).order('likes_count DESC') if params[:book_genre].present?
  end

  def new
    if params[:search].present?
      @podcasts = ListenApi.search(params[:search][:query])
    end
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)

    @podcast.user = current_user
    @podcast.group = @group

    @podcast.remote_image_url = @podcast.image_path

    if @podcast.save
      redirect_to group_podcasts_path(@group), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def podcast_params
    permitted_params = params.require(:podcast).permit(:owner_grade, :owner_comment, :title, :description, :image_path, :genres, :publisher)
    permitted_params[:genres] = permitted_params[:genres].split(" ")
    return permitted_params
  end
end
