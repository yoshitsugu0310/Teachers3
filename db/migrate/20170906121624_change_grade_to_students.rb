class ChangeGradeToStudents < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :grade, :integer
  end
end
