class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :accommodation_name
      t.text :accommodation_detail
      t.integer :accommodation_fee
      t.string :accommodation_address
      t.integer :user_id

      t.timestamps
    end
  end
end
