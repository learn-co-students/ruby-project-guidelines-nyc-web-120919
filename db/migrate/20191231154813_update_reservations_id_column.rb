class UpdateReservationsIdColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :student_id, :teacher_id
  end
end
