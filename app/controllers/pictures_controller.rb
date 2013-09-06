class PicturesController < ApplicationController

  def index
    @pictures = Picture.includes(:category).page params[:page]
  end

  def show
    @picture = Picture.includes(likes: :user).find(params[:id])

    unless @picture.category.title == params[:title]
      redirect_to categories_path
    end

  end

end