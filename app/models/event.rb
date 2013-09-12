class Event < ActiveRecord::Base
  attr_accessible :description, :kind, :kind_id, :user_id

  belongs_to :user

end
