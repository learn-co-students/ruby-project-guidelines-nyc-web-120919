class UpdateStudentsColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :club, :string
  end
end
