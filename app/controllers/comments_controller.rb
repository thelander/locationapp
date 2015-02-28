class CommentsController < ApplicationController
  before_action :set_market

  def create
    @comment = @market.comments.new comment_params
    @comment.user = current_user

    authorize @comment
    
    if @comment.save
      flash[:notice] = t("comments.sent")
    else
      flash[:alert] = t("comments.alert")
    end

    redirect_to @market
  end

  def destroy
  end

  private
  def set_market
    @market = Market.find params[:market_id] unless @market
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
