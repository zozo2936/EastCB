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
    @comments = @book.comments.order(id: :desc)
  end

  def comment
    # comment 角度
    # @comment = Comment.new(comment_params, user:current_user, book:@book)
    # book 角度
    @comment = @book.comments.build(comment_params)
    # user 角度, 沒有has_many方法
    # @comment = current_user.comments.build(comment_params, book: @book)
    if @comment.save
      respond_to do |format|
        format.js {render 'abc'}
      end
      # render js: 'alert("hi");'
      # redirect_to @book, notice: '成功'
    else
      render js: 'alert("發生錯誤");'
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def comment_params
    params.require(:comment)
          .permit(:title, :content)
          .merge(user: current_user)
  end
end