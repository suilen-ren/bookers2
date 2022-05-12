class BooksController < ApplicationController
  def index
    @user= current_user
    @book= Book.new
    @books= Book.all
  end

  def show
    @books =Book.all
    @showbook = Book.find(params[:id])
    @book = Book.new
    @user = @showbook.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title ,:body)
  end
end
