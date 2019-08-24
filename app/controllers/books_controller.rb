require 'open-uri'

class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = GoogleBooks.search(params[:search][:query])
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      redirect_to root_path, notice: "Bien ajouté !"
    else
      redirect_to books_path, alert: "Un problème est survenu..."
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :authors, :published_date, :description, :image_link)
  end
end
