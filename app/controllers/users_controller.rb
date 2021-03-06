class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "It worked."
      redirect_to edit_user_path(@user)
    else
      flash[:error] = "It didn't work."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
