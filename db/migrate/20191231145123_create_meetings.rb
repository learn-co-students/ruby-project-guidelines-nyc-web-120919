class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table(:meetings) do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.date :date 
    end 
  end
end
