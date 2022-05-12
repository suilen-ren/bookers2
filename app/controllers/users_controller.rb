class UsersController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def show
    @user =User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render user_edit_path(@user.id)
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
