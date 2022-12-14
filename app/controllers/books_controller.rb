class BooksController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]



  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        redirect_to book_path(@book.id)
    flash[:notice] = "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end

  end


  def show
    @book = Book.find(params[:id])

    @new_book = Book.new
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book.id)
    flash[:notice] ="You have updated book successfully."
    else
      render :edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @books = Book.find(params[:id])
    login_user_id = current_user.id
    user_id = @books.user_id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end
end
