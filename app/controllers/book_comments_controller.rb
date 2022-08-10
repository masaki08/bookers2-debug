class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿します'
    　render :book_comments #render先にjsファイルを指定
    　#redirect_to book_path(@book), notice: 'コメントを削除しました'
    else
      render :error
    end
  end
  
  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    #redirect_to book_path(params[:book_id]), alert: 'コメントを削除しました'
    @book = Book.find(params[:book_id])
    render :book_comments #rander先にjsファイルを指定
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
