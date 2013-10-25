class NavigationEvent < ActiveRecord::Base

  attr_accessible :url, :user_id, :created_at

  belongs_to :user

end
