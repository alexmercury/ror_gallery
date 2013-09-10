class LikesController < ApplicationController

  before_filter :authenticate_user!

  def create
    like = current_user.likes.new(picture_id: params[:picture_id])
    if like.save
      respond_to do |format|
        format.js{render js:"window.location.reload();"}
      end
    else
      respond_to do |format|
        format.js{render js:"alert('Error');"}
      end
    end

  end

  def destroy

    like = Like.where('user_id = :user_id AND picture_id = :picture_id', user_id: current_user.id, picture_id: params[:picture_id]).first

    if like.destroy
      respond_to do |format|
        format.js{render js:"window.location.reload();"}
      end
    else
      respond_to do |format|
        format.js{render js:"alert('Error');"}
      end
    end

  end

end