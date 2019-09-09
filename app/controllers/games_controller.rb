class GamesController < ApplicationController
  before_action :set_group

  def index
    @games = @group.games.where(nil).order('likes_count DESC') # creates an anonymous scope
    @games = @games.filtered(params[:game_genre]).order('likes_count DESC') if params[:game_genre].present?
  end

  def new
    if params[:search].present?
      @games = Igdb.search(params[:search][:query])
    end
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    @game.user = current_user
    @game.group = @group
    @game.remote_background_image_url = game_params[:background_image]

    if @game.save
      redirect_to group_games_path(@group), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def game_params
    permitted_params = params.require(:game).permit(:genres, :owner_grade, :owner_comment, :name, :released, :platforms, :background_image, :description, :devs)
    permitted_params[:genres] = permitted_params[:genres].split(" ")
    permitted_params[:devs] = permitted_params[:devs].split(" ")
    permitted_params[:platforms] = permitted_params[:platforms].split(" ")

    return permitted_params
  end
end
