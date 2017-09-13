class AddAssosiationToMatche < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :student, foreign_key: true
    add_reference :matches, :teacher, foreign_key: true
  end
end
