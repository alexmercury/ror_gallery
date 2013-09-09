class LikesController < ApplicationController

  def create
    like = current_user.likes.new(picture_id: params[:picture_id])

    if like.save
      render nothing: true
    else
      render nothing: true
    end

  end

  def destroy

    like = Like.where('user_id = :user_id AND picture_id = :picture_id', user_id: current_user.id, picture_id: params[:picture_id]).first

    if Like.destroy(like.id)
      render nothing: true
    else
      render nothing: true
    end

  end

end