class Event < ActiveRecord::Base

  attr_accessible :kind, :kind_id, :user_id

  belongs_to :user

end
