class CategorySubscription < ActiveRecord::Base

  attr_accessible :category_id, :user_id

  belongs_to :user
  belongs_to :category

  validates :category_id, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0},
            uniqueness: {scope: :category_id}

end