class UsersController < ApplicationController

 def index
    @users = User.all
 end

 def show
    @user = User.find(params[:id])
    @books = @user.books
 end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
   is_matching_login_user
   @user = User.find(params[:id])
   if @user.update(user_params)
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
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
     redirect_to users_path
    end
  end

end


