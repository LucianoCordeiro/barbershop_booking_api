class CreateBookingTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_times do |t|
      t.date :day, null: false
      t.integer :hour, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
