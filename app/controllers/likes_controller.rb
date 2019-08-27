class LikesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @like = Like.new
    @like.book = @book
    @like.user = current_user

    @like.save
    redirect_to group_path(@book.group)
  end

  def destroy
    @like = Like.find(params[:id])
    @group = @like.book.group
    @like.destroy

    redirect_to group_path(@group)
  end
end
