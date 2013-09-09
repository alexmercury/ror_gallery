class Like < ActiveRecord::Base

  attr_accessible :picture_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :picture, counter_cache: true

  validates :picture_id, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0},
            uniqueness: {scope: :picture_id}

end