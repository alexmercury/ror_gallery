class Picture < ActiveRecord::Base

  attr_accessible :title, :image, :category_id

  belongs_to :category

  has_attached_file :image,
                    url: '/assets/picture/:id/:style/:basename.:extension',
                    path:':rails_root/public/assets/picture/:id/:style/:basename.:extension',
                    default_url: 'no_image.gif',
                    styles: {mini:'40x40>'}
end
