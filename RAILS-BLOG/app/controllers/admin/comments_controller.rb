class Admin::CommentsController < Admin::ApplicationController
  def index
    if params[:search].present?
      @comments = Comment.matching_fullname_or_messsage(params[:search]).page params[:page]
    else
      @comments = Comment.where(status: to_bool(params[:status])).page params[:page] #using it instead of just "params[:status]" in order to convert string into boolean, 'cause when it comes from the url, it comes in form of a string
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(status: params[:status])
      redirect_to :back, notice: 'Successfully updated your comment'
    else
      redirect_to :back, notice: 'There was a problem while updating your comment'
    end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to :back, notice: 'Successfully deleted the comment'
  end
end
