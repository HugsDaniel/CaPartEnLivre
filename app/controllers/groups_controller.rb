class GroupsController < ApplicationController
  def show
    @group    = Group.find(params[:id])

    @books = Book.where(nil) # creates an anonymous scope
    @books = @books.filtered(params[:book_genre]) if params[:book_genre].present?

    @movies = Movie.where(nil) # creates an anonymous scope
    @movies = @movies.filtered(params[:movie_genre]) if params[:movie_genre].present?

    @series = Series.where(nil) # creates an anonymous scope
    @series = @series.filtered(params[:series_genre]) if params[:series_genre].present?

    @games = Game.where(nil) # creates an anonymous scope
    @games = @games.filtered(params[:game_genre]) if params[:game_genre].present?

    @comment  = Comment.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      current_user.add_to(@group)
      redirect_to group_path(@group), notice: "Bien créé !"
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :image)
  end
end
