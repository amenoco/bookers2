class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_path(current_user)
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

    @users = User.all
    # @books = user.books
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end

end