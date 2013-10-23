class CategoriesController < ApplicationController

  before_filter :authenticate_user!, only: [:subscribe, :unsubscribe]

  def index
    @categories = Category.includes(:users, :translations)
  end

  def show
    @category = Category.includes(:users).where('slug = :slug', slug: params[:id]).first
    @pictures = Picture.includes(:category).where('category_id = :id', id: @category.id).page(params[:page])
  end

  def subscribe
    category_subscribe = current_user.category_subscriptions.new(category_id: params[:category_id])
    if category_subscribe.save

      Resque.enqueue(UserEvents,
                     {user_id: current_user.id,
                      kind: 'subscribe',
                      kind_id: category_subscribe.id
                     })

      render nothing: true
    else
      respond_to do |format|
        format.js{render js:"alert('Error');"}
      end
    end

  end

  def unsubscribe

    category_subscribe = CategorySubscription.where('user_id = :user_id AND category_id = :category_id', user_id: current_user.id, category_id: params[:category_id]).first

    if category_subscribe.respond_to?(:destroy)

      category_subscribe.destroy

      Resque.enqueue(UserEvents,
                     {user_id: current_user.id,
                      kind: 'unsubscribe',
                      kind_id: category_subscribe.id
                     })

      render nothing: true
    else
      respond_to do |format|
        format.js{render js:"alert('Error');"}
      end
    end

  end

end