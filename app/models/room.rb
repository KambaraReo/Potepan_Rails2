class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  has_one_attached :accommodation_img

  validates :accommodation_name, presence: true
  validates :accommodation_detail, presence: true, length: { maximum: 500 }
  validates :accommodation_fee, presence: true, numericality: { only_integer: true }
  validates :accommodation_address, presence: true
end
