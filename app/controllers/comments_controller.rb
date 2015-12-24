class CommentsController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @topic = @post.topic
    authorize @comment
    @comment.user_id = current_user.id
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @topic = @post.topic
    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash[:notice] = "Comment couldn't be deleted. Try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
