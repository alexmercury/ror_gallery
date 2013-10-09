class PicturesController < ApplicationController

  def index
    @pictures = Picture.includes(:category).page params[:page]
  end

  def home
    @pictures = Picture.includes(:category).page params[:page]
  end

  def show
    @picture = Picture.includes(:users).find(params[:id])
    @comments = Comment.includes(:user).where('picture_id = :id', id: params[:id]).order('created_at DESC').page(params[:page])

    unless @picture.category.title == params[:title]
      redirect_to categories_path
    end
  end

  def load_comments
    comments = Comment.includes(:user).where('picture_id = :id', id: params[:id]).order('created_at DESC').page(params[:page])
    render json: comments.to_json(include:{user:{only: :name}})
  end

end