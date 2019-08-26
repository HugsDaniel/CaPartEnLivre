class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @books = @group.books.includes(:comments, :user)
    @comment = Comment.new
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
