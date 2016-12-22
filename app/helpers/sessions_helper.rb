module SessionsHelper

# Helper for defining the user during login
  def log_in(user)
    session[:id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end


  def current_user
    if (user_id = session[:id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:id])
      @user = User.find_by(id: user_id)
      if @user && user.authenticated?(cookies[:remember_token])
        log_in @user
        @current_user = @user
      end
    end
  end

  def log_out
    session.delete(:id)
    @current_user = nil
  end

end
