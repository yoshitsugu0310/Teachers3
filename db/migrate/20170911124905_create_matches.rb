class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.integer :request
      t.integer :adoption
      t.integer :money

      t.timestamps
    end
  end
end
