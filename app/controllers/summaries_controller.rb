class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new(summary_params)
    if @summary.save
      redirect_to @summary, notice: "Summary was successfully saved"
    else
      flash[:error] = "Error creating summary, please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    if @post.summary == nil
      flash[:notice] = "No summary exists for this topic."
      redirect_to [@topic, @post]
    else
      @summary = @post.summary
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = @post.summary
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    if @summary.update_attributes(summary_params)
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post, @post.summary]
    else 
      flash[:error] = "Error saving summary. Please try again."
      render :edit
    end
  end
  
  private
  
  def summary_params
    params.require(:summary).permit(:description)
  end
end
