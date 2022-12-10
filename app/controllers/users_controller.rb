class UsersController < ApplicationController
  def show
    @user = current_user
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update

    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def index
     @user =　Book.find
     @books = @user.books
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end