class BooksController < ApplicationController
  before_action :find_book, only:[:show,:comment]
  layout 'book'

  def index 
    @books = Book.available
                 .with_attached_cover_image
                 .page(params[:page])
                 .per(10)
    @publishers = Publisher.available
  end

  def show
    @comment = Comment.new
  end

  def comment
    def comment
      # comment 角度
      # @comment = Comment.new(comment_params, user:current_user, book:@book)
      # book 角度
      @comment = @book.comments.build(comment_params)
      # user 角度, 沒有has_many方法
      # @comment = current_user.comments.build(comment_params, book: @book)
      if @comment.save
        redirect_to @book,notice: '成功'
      else
        #失敗 自己填
      end
   end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :comment).marge(user:current_user)
  end
end
