class Category < ActiveRecord::Base

  attr_accessible :title

  has_many :included_pictures, class_name: 'Picture', limit: 3, order: 'RANDOM()'
  has_many :pictures, dependent: :destroy
  has_many :category_subscriptions, dependent: :destroy
  has_many :users, through: :category_subscriptions

  validates :title, presence: true, length: {minimum: 1, maximum: 255}, uniqueness: true

end