class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      auto_login(@user)
  		redirect_to @user, :notice => "Signed up!"
  	else 
  		render :new
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => "Profile updated"
    else
      render 'edit' 
    end  
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :name, :age, :height, :goal, :weight)
  end
end
