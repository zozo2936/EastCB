class BooksController < ApplicationController
    def index 
      @book = Book.all
    end

    def new
        @book = Book.new
    end

  
    def create
        @book = Book.new(book_params)
        if @book.save
          redirect_to root_path, notice: '新增書本成功'
        else
          # redirect_to new_book, notice: '新增失敗'
          render :new #借 new.html.erb
        end
    end

    def edit
      # render html:params  拿網頁參數
      @book = Book.find_by(id:params[:id])
      # redirect_to root_path unless @book, notice:'查無此書'

      # begin
      #   @book = Book.find(params[:id])
      # rescue
      #   redirect)to root_path,notice:'查無此書'
      # end
    end

    def update
      @book = Book.find(params[:id])

      if @book.update(book_params)
        redirect_to root_path, notice: '更新成功'
      else
        render :edit
      end
    end


    private

    def book_params
  
 params.require(:book).permit(:title,
            :description,
            :list_price,
            :sell_price,
            :page_num,
            :isbn,
            :isbn13)

      
        end
end
