class UsersController < ApplicationController
  def show
    @user = current_user
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

    # @user =　User.find(params[:id])
    # @books = user.books
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :introduction)
  end

end