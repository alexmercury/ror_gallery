class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    comment = current_user.comments.new(params[:comment])

    if comment.save

      Resque.enqueue(UserEvents,
                     {user_id: current_user.id,
                      kind: 'comment',
                      kind_id: comment.id
                     })

      redirect_to :back
    else
      redirect_to :back, alert: comment.errors.full_messages.join(', ')
    end

  end

end