class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:create]

  def index
    @comments = Comment.includes(:user).order('created_at DESC')
  end

  def create
    comment = current_user.comments.new(params[:comment])

    if comment.save

      Resque.enqueue(UserEvents,
                     {user_id: current_user.id,
                      kind: 'comment',
                      kind_id: comment.id
                     })

      PusherRails.comment_add({comment: comment, user_name: current_user.name})

      render json: comment.to_json(include:{user:{only: :name}})
    else
      render json: {error: comment.errors.full_messages.join(', ')}
    end

  end

end