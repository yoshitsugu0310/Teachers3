class AddDataToMatch < ActiveRecord::Migration[5.1]
  def change
     remove_column :matches, :request_time1
     add_column :matches, :request_time1, :datetime
     remove_column :matches, :request_time2
     add_column :matches, :request_time2, :datetime
     remove_column :matches, :request_time3
     add_column :matches, :request_time3, :datetime
     remove_column :matches, :appoint_time
     add_column :matches, :appoint_time,  :datetime
  end
end
