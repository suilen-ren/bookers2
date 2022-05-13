class BooksController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}

  def ensure_current_user
    @book = Book.find(params[:id])
    if @book.user != current_user
      flash[:notice] = "権限がありません。"
      redirect_to books_path
    end
  end

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
      flash[:notice] = "You have updated book successfully."
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
      flash[:notice] = "You have created book successfully."
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
