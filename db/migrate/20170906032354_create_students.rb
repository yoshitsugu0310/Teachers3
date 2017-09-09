class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :sex
      t.integer :post_number
      t.integer :subject
      t.string :grade
      t.string :station
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
