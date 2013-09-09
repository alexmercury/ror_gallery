class Picture < ActiveRecord::Base

  attr_accessible :title, :image, :category_id

  belongs_to :category, counter_cache: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  paginates_per 5

  has_attached_file :image,
                    url: '/assets/picture/:id/:style/:basename.:extension',
                    path:':rails_root/public/assets/picture/:id/:style/:basename.:extension',
                    default_url: 'no_image.gif',
                    styles: {mini:'40x40>'}

  validates :title, presence: true, length: {minimum: 5, maximum: 255}

end