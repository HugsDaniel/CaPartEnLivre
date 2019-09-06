require 'open-uri'

class BooksController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    if params[:search].present?
      @books = GoogleBooks.search(params[:search][:query])
    end
    @book = Book.new
  end

  def create
    @group = Group.find(params[:group_id])
    @book = Book.new(book_params)
    @book.user = current_user
    @book.group = @group
    @book.remote_cover_url = @book.image_link

    if @book.save
      redirect_to group_path(id: @group, previous: "book"), notice: "Bien ajouté !"
    else
      render :new, alert: "Un problème est survenu..."
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :authors, :published_date, :description, :image_link, :owner_comment)
  end
end
