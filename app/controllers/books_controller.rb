class BooksController < ApplicationController

  def new
   # @books = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)




  end


  def show
    @book = Book.find(params[:id])
    flash[:notice] = "You have created book successfully."
    @books = Book.all
    @user = current_user
  end



  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
