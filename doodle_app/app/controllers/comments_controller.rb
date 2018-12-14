class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(params[:comment].permit(:subject, :body))

    if @comment.save
      CommentsMailer.with(comment: @comment).post_comment.deliver_now
      flash[:notice] = 'Comment was successfully saved!'
      redirect_to @item
    else
      flash[:alert] = 'Comment could not be saved!'
      redirect_back fallback_location: @item
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:subject, :body)
  end
end