class Category < ActiveRecord::Base

  attr_accessible :title

  has_many :pictures, dependent: :destroy

end
