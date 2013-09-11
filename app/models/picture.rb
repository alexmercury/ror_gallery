class Picture < ActiveRecord::Base

  after_create :subscribe_mailer

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


  def subscribe_mailer
    #users = User.where('users.id IN (SELECT category_subscriptions.user_id FROM category_subscriptions WHERE category_id = :id)', id: self.category_id)
    #Resque.enqueue(CategorySubscriptionMailer, users)
  end


end