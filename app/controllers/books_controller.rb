class BooksController < ApplicationController

  def create
    @book = Book.new(params_book)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @book = Book.all
      render "index"
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(params_book)
    redirect_to book_path(@book), notice: "You have updated book successfully."
  end



  private
    def params_book
      params.require(:book).permit(:title, :body)
    end
end
