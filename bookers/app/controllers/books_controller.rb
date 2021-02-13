class BooksController < ApplicationController

  #投稿一覧表示
  def index
    @books = Book.all
    @book = Book.new
  end

  #新規投稿
  def create
    @books = Book.all
    @book = Book.new(book_params)
    
    #バリデーションチェック
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  #詳細画面表示
  def show
    @book = Book.find(params[:id])
  end

  #編集画面表示
  def edit
    @book = Book.find(params[:id])
  end

  #編集反映
  def update
    @book = Book.find(params[:id])
    
    #バリデーションチェック
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  #投稿削除
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end
  
  #ストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
