class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:create]

  def index
    @comments = Comment.includes(:user, picture: :category).order('created_at ASC').page(params[:page]).per 10
  end

  def create
    comment = current_user.comments.new(params[:comment])

    if comment.save

      Resque.enqueue(UserEvents,
                     {user_id: current_user.id,
                      kind: 'comment',
                      kind_id: comment.id
                     })

      picture = Picture.includes(:category).where('id = :id', id: comment.picture_id)

      PusherRails.comment_add({comment: comment, user_name: current_user.name,
                               link: view_context.link_to(I18n.t('views.comments.index.picture_link'), picture_path(comment.picture, comment.picture.id))
                              })

      render json: comment.to_json(include:{user:{only: :name}})
    else
      render json: {error: comment.errors.full_messages.join(', ')}
    end

  end

end