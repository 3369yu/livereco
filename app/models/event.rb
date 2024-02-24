class Event < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  
  enum buy_method: { not_purchased: 0, purchased: 1 }
  
end
