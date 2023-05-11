class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :checkin_at, presence: true
  validates :checkout_at, presence: true
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :date_before_checkin
  validate :date_before_checkout

  def date_before_checkin
    return if checkin_at.blank?
    errors.add(:checkin_at, "は今日以降の日付を選択してください") if checkin_at.to_date < Date.today
  end

  def date_before_checkout
    return unless checkin_at? && checkout_at?
    errors.add(:checkout_at, "はチェックイン日より後の日付を選択してください") if checkout_at <= checkin_at
  end

end
