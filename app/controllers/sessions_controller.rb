class SessionsController < ApplicationController

  def new

  end


  def create
    @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        redirect_to '/stores'
      else
      # The error message that will be display if the combination is not correct
      flash.now[:danger] = 'Sorry, the user/password combination is not valid'
      # then goes to new
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
