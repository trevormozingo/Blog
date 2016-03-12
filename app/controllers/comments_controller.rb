class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def edit
    authPostEdit(@comment)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user 
    @comment.post = Post.find(params[:post_params])
    if @comment.save
      redirect_to :controller => 'welcome', :action => 'home'
    else
      redirect_to :controller => 'welcome', :action => 'home'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to :controller => 'welcome', :action => 'home' 
    else
      redirect_to :controller => 'welcome', :action => 'home'
    end
  end

  def destroy
    @comment.destroy
    redirect_to :controller => 'welcome', :action => 'home' 
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
