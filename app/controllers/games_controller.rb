class GamesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    if params[:search].present?
      @games = Igdb.search(params[:search][:query])
    end
    @game = Game.new
  end

  def create
    @group = Group.find(params[:group_id])
    @game = Game.new(game_params)

    @game.user = current_user
    @game.group = @group
    @game.remote_background_image_url = game_params[:background_image]

    if @game.save
      redirect_to group_path(id: @group, previous: "game"), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def game_params
    permitted_params = params.require(:game).permit(:genres, :owner_grade, :owner_comment, :name, :released, :platforms, :background_image, :description, :devs)
    permitted_params[:genres] = permitted_params[:genres].split(" ")
    permitted_params[:devs] = permitted_params[:devs].split(" ")
    permitted_params[:platforms] = permitted_params[:platforms].split(" ")

    return permitted_params
  end
end
