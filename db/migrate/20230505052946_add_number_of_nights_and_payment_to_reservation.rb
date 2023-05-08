class AddNumberOfNightsAndPaymentToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :number_of_nights, :integer
    add_column :reservations, :payment, :integer
  end
end
