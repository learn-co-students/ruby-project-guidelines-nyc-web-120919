class UpdateReservationsDateColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations, :date, :string
  end
end
