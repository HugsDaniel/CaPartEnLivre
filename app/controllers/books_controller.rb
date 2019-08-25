require 'open-uri'

class BooksController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    if params[:search].present?
      @books = GoogleBooks.search(params[:search][:query])
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @book = Book.new(book_params)
    @book.user = current_user
    @book.group = @group

    if @book.save
      redirect_to group_path(@group), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :authors, :published_date, :description, :image_link)
  end
end
