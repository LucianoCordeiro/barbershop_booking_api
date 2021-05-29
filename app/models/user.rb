class User < ApplicationRecord
  has_secure_password

  has_one :booking_time

  def has_booked_time?
    booking_time.present?
  end
end
