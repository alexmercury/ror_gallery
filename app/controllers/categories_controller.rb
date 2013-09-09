class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.where('title = :title', title: params[:title]).first
    @pictures = Picture.where('category_id = :id', id: @category.id).page(params[:page])
  end

end
