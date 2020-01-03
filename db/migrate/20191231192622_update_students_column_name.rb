class UpdateStudentsColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :troublemaker?, :disciplinary_marks
  end
end
