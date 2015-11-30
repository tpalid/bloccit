class CommentsController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.new(comment_params)
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
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@topic, @post]
    else
      flash[:notice] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
