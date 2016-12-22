class UsersController < ApplicationController

  # This goes to the current user page
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
       log_in @user
       flash[:success] = "Sign up successful!"
       redirect_to @user
      else
        render 'new'
      end
  end

  def current_user
    User.find_by(id: session[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update_attributes(user_params)

      else
        render 'edit'
    end
  end

private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :username,
                                   :gender, :email, :password,
                                   :password_confirmation)
  end

end
