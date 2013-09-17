class Category < ActiveRecord::Base

  attr_accessible :title

  has_many :pictures, dependent: :destroy
  has_many :category_subscriptions, dependent: :destroy
  has_many :users, through: :category_subscriptions

  validates :title, presence: true, length: {minimum: 1, maximum: 255}, uniqueness: true

end