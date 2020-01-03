class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table(:students) do |t|
      t.string :name
      t.integer :grade
      t.float :gpa
      t.boolean :troublemaker?
    end 
  end
end
