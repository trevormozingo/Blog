class WelcomeController < ApplicationController

  def edit
  end

  def index
  	if session[:user_id]
  		redirect_to :controller => 'welcome', :action => 'home'
  	end
  	@user = User.new
  end

  def home
    checkSesh
    @post = Post.new
    @comment = Comment.new
  end

end 
