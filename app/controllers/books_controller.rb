class BooksController < ApplicationController
  
  def new
   # @books = Book.new
  end
  
  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     flash[:notice] = "Signed out successfully."
     
     redirect_to book_path(book.id)
  end
  
  def index 
    @books = Book.all  
    flash[:notice] = "Signed in successfully."
  end
  
  def show
       @book = Book.find(params[:id])  
  end

  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
