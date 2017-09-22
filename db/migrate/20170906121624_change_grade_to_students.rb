class ChangeGradeToStudents < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :grade, 'integer USING CAST(grade AS integer)'
  end
end
