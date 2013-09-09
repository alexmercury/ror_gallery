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
  validates :category_id, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates_attachment :image, :presence => true, :size => { :in => 0..5.megabytes }

end