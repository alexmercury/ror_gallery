class Comment < ActiveRecord::Base

  attr_accessible :description, :picture_id, :user_id

  belongs_to :user
  belongs_to :picture

end