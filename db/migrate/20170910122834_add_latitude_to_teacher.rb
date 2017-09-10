class AddLatitudeToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :latitude, :float
    add_column :teachers, :longitude, :float
  end
end
