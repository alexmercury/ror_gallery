class CommentsController < ApplicationController

  def create
    comment = current_user.comments.new(params[:comment])

    if comment.save

      Resque.enqueue(UserEvents,
                     {user_id: current_user.id,
                      kind: 'comments',
                      kind_id: comment.id,
                      description: 'Comment create'})

      redirect_to :back
    else
      redirect_to :back, alert: comment.errors.full_messages.join(', ')
    end

  end

end