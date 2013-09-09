class Category < ActiveRecord::Base

  attr_accessible :title

  has_many :pictures, dependent: :destroy

  validates :title, presence: true, length: {minimum: 5, maximum: 255}

end