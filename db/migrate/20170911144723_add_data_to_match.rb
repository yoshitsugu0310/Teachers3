class AddDataToMatch < ActiveRecord::Migration[5.1]
  def change
     change_column :matches, :request_time1, 'timestamp USING CAST(request_time1 AS timestamp)'
     change_column :matches, :request_time2, 'timestamp USING CAST(request_time2 AS timestamp)'
     change_column :matches, :request_time3, 'timestamp USING CAST(request_time3 AS timestamp)'
     change_column :matches, :appoint_time,  'timestamp USING CAST(appoint_time AS timestamp)'
  end
end
