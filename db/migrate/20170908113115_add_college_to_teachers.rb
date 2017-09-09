class AddCollegeToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :sex, :integer
    add_column :teachers, :post_number, :integer
    add_column :teachers, :japanese, :integer
    add_column :teachers, :math, :integer
    add_column :teachers, :social, :integer
    add_column :teachers, :science, :integer
    add_column :teachers, :english, :integer
    add_column :teachers, :university_name, :string
    add_column :teachers, :fee, :integer
    add_column :teachers, :appeal, :text
  end
end
