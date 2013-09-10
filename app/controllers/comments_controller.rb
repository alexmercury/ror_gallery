class CommentsController < ApplicationController

  def create
    comment = current_user.comments.new(params[:comment])

    if comment.save
      redirect_to :back
    else
      redirect_to :back, alert: comment.errors.full_messages.join(', ')
    end

  end

end