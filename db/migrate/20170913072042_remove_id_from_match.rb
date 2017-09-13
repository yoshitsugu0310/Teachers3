class RemoveIdFromMatch < ActiveRecord::Migration[5.1]
  def change
    remove_column :matches, :teacher_id, :integer
    remove_column :matches, :student_id, :integer
  end
end
