class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table(:reservations) do |t|
      t.integer :student_id
      t.integer :room_id
      t.date :date
    end 
  end
end
