class AddTimeToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :request_time1, :integer
    add_column :matches, :request_time2, :integer
    add_column :matches, :request_time3, :integer
    add_column :matches, :appoint_time, :integer
  end
end
