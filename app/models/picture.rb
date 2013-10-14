class Picture < ActiveRecord::Base

  after_create :subscribe_mailer

  attr_accessible :title, :image, :category_id

  belongs_to :category, counter_cache: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :likes

  paginates_per 5

  has_attached_file :image,
                    storage: :dropbox,
                    dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                    path: 'ror_gallery/:id__:style__:filename',
                    default_url: 'no_image.gif',
                    styles: {thumb:'256x256>', default: '128x128>'}

  validates :title, presence: true, length: {minimum: 5, maximum: 255}
  validates :category_id, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates_attachment :image, presence: true, size: { in: 0..5.megabytes }

  def subscribe_mailer
    Resque.enqueue(CategorySubscriptionMailer, self.id)
  end

end