class Comment < ActiveRecord::Base

  attr_accessible :description, :picture_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :picture, counter_cache: true

  paginates_per 5

  validates :description, presence: true, length: {minimum: 2, maximum: 2048}
  validates :picture_id, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0}

  default_scope {order('created_at DESC')}

end