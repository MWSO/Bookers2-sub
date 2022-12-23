class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :is_matching_login_user, only: [:edit, :update]



  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book.id)
    else
     @create_book = Book.new
     @books = Book.all
     render "books/index"
    end
  end

 def index
    @users = User.all
    @current_user = current_user
    @create_book = Book.new
 end

 def show
    @user = User.find(params[:id])
    @books = @user.books
    @create_book = Book.new
 end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user.id)
   else
    render :edit
   end
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user_id = User.find(params[:id]).id
    login_user_id = current_user.id
    if(user_id != login_user_id)
     redirect_to user_path(current_user.id)
    end
  end

end


