class BooksController < ApplicationController
  def index
    @user= current_user
    @book= Book.new
    @books= Book.all
  end

  def show
    @showbook = Book.find(params[:id])
    @book = Book.new
    @user = @showbook.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title ,:book)
  end
end
