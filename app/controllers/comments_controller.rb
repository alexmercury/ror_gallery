class CommentsController < ApplicationController

  def create
    comment = current_user.comments.new(params[:comment])

    if comment.save

      redirect_to :back

    else

      render nothing: true

    end

  end

end