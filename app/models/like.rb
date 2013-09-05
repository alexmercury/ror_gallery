class Like < ActiveRecord::Base

  attr_accessible :picture_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :picture, counter_cache: true

end
