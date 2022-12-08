class UsersController < ApplicationController
  def show
    @user =　Book.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def update
  end

  def index
    @user =　Book.find(params[:id])
    @books = @user.books
  end

  def destroy
  end


end
