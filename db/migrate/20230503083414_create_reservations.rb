class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :checkin_at
      t.datetime :checkout_at
      t.integer :number_of_guests
      t.integer :room_id

      t.timestamps
    end
  end
end
