class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)
    @comment.book = @book
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render '/' }
        format.js  # <-- idem
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
