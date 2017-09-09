class AddSubjectToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :japanese, :integer
    add_column :students, :math, :integer
    add_column :students, :science, :integer
    add_column :students, :social, :integer
    add_column :students, :english, :integer
    remove_column :students, :subject, :integer
  end
end
