class BooksController < ApplicationController

  def new
   # @books = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new

  end
  def create
     @book = Book.new(book_params)
       
     @book.save
      if @book.save
      	redirect_to book_path(book.id)
  	  else
		render'books/index'
	end

     redirect_to book_path(book.id)
  end


  def show
    @book = Book.find(params[:id])
    flash[:notice] = "Signed in successfully."
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
