class PicturesController < ApplicationController

  def index
    @pictures = Picture.includes(:category).order('likes_count DESC').page params[:page]
  end

  def home
    @pictures = Picture.includes(:category).page params[:page]
  end

  def show
    @picture = Picture.includes(:users, :category).where('pictures.id = :id AND categories.slug = :slug', id: params[:id], slug: params[:slug]).first
    @comments = Comment.includes(:user).where('picture_id = :id', id: params[:id]).order('created_at DESC').page(params[:page])
  end

  def load_comments
    comments = Comment.includes(:user).where('picture_id = :id', id: params[:id]).order('created_at DESC').page(params[:page])
    render json: comments.to_json(include:{user:{only: :name}})
  end

end