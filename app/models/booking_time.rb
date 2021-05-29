class BookingTime < ApplicationRecord
  belongs_to :user, optional: true

  def formatted_day
    day.strftime("%d/%m/%Y")
  end

  def formatted_hour
    "#{hour} h"
  end

  def booked?
    user.present?
  end
end
