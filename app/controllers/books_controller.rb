class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end
  
  def index 
    @books = Book.all  
  end
  
  def show
  end

  def destroy
  end
  
  private
end
