class BooksController < ApplicationController
   before_action :authenticate_user!
   before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to books_path
    else
     @create_book = @book
     @books = Book.all
     render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @current_user = current_user
    @create_book = Book.new
  end

  def index
    @books = Book.all
    @current_user = current_user
    @create_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book.id)
    else
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully deleted"
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    user_id =Book.find(params[:id]).user.id
    login_user_id = current_user.id
    if(user_id != login_user_id)
     redirect_to users_path
    end
  end

end