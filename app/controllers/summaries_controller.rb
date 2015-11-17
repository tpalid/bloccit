class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end
  
  def create
    @topic = Topic.find(params[:post_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new(summary_params)
    authorize @summary
    if @summary.save
      redirect_to @summary, notice: "Summary was successfully saved"
    else
      flash[:error] = "Error creating summary, please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @post = @topic.post.find(params[:id])
    @summary = post.summary
    authorize @summary
  end

  def edit
    @summary = Summary.find(params[:id])
    authorize @summary
  end
  
  def update
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(summary_params)
      redirect_to @summary
    else 
      flash[:error] = "Error saving summary. Please try again."
      render :edit
    end
  end
  
  private
  
  def summary_params
    params.require(:summary).permit(:description)
end
