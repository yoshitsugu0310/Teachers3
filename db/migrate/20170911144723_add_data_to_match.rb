class AddDataToMatch < ActiveRecord::Migration[5.1]
  def change
     change_column :matches, :request_time1, :datetime
     change_column :matches, :request_time2, :datetime
     change_column :matches, :request_time3, :datetime
     change_column :matches, :appoint_time, :datetime
  end
end
