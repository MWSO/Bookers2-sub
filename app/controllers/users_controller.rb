class UsersController < ApplicationController
  def show
    @user = User.all
    @books = @user.books
  end

  def edit
  end
end


