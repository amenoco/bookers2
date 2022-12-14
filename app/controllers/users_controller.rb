class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
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
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path
    end
  end
  
end