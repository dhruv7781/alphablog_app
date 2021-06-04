class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "your account info was updated"
      redirect_to article_new_path(@article)

    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to alphablog, you have successfully signed up."
      redirect_to article_new_path(@article)

    else
      render 'new'
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
