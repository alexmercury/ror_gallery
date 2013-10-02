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
      render json: comment.to_json(include:{user:{only: :name}})
    else
      render json: {error: comment.errors.full_messages.join(', ')}
    end

  end

end