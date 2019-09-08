class BooksController < ApplicationController
  before_action :set_group, only: [:new, :create]

  def new
    if params[:search].present?
      @books = GoogleBooks.search(params[:search][:query])
    end
    @book = Book.new
  end

  def create
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

  def set_group
    @group = Group.find(params[:group_id])
  end

  def book_params
    permitted_params = params.require(:book).permit(:genres, :owner_grade, :title, :authors, :published_date, :description, :image_link, :owner_comment)
    permitted_params[:genres] = permitted_params[:genres].split(" ")

    return permitted_params
  end
end
