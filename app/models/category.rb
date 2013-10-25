class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug

  attr_accessible :slug, :title_locale, :translations
  translates :title_locale

  has_many :included_pictures, class_name: 'Picture', limit: 3, order: 'RANDOM()'
  has_many :pictures, dependent: :destroy
  has_many :category_subscriptions, dependent: :destroy
  has_many :users, through: :category_subscriptions

  validates :slug, presence: true, length: {minimum: 1, maximum: 255}, uniqueness: true

  active_admin_translates :title_locale

end