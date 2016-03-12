class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def edit
    authPostEdit(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
      if @post.save
        redirect_to :controller => 'welcome', :action => 'home' 
      else
        redirect_to :controller => 'welcome', :action => 'home' 
      end
  end

  def update
    if @post.update(post_params)
      redirect_to :controller => 'welcome', :action => 'home' 
    else
      redirect_to :controller => 'welcome', :action => 'home' 
    end
  end

  def destroy
    @post.destroy
    redirect_to :controller => 'welcome', :action => 'home' 
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :content)
    end
end







