class UsersController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}

  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @book = Book.new
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
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end



  private
  def user_params
    params.require(:user).permit(:name ,:introduction, :profile_image)
  end
end
