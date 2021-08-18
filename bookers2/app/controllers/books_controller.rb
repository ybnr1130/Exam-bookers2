class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      # flash[:notice] = "You habe created book successfully"
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = book.all
      render :index
    end
  end
  
  def edit
    
  end
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end
  
  def destroy
    
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
