class Event < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  enum buy: { no_buy: 0, buy: 1 }
  enum status: { closed: 0, opened: 1 }

  validates :name, presence: true
  validates :start, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end