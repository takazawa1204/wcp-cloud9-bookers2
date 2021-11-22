class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params_user)
    redirect_to user_path(@user)
  end
  
  private
  
  def params_user
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
