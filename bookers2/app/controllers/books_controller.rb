class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully"
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
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
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully"
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    # flash[:success] = "Book was successfully destroyed"
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
