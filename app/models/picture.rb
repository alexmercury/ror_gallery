class Picture < ActiveRecord::Base
  attr_accessible :title, :avatar
  has_attached_file :avatar
end
