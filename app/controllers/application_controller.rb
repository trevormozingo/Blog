class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def checkAdmin
      if current_user.AdminId == 1
        true
      else
        false
      end
    end


  def checkSesh
      if !session[:user_id]
      redirect_to :controller => 'welcome', :action => 'index'
    end
  end

  def authCommentEdit(post)
    if current_user.id != post.user.id
      redirect_to :controller => 'welcome', :action => 'index'
    end
  end

  def authPostEdit(post)
    if current_user.id != post.user.id
      redirect_to :controller => 'welcome', :action => 'index'
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def check(user)
    user == current_user
  end

  helper_method :check
  helper_method :current_user
  helper_method :checkAdmin
end
