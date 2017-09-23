class AddDataToMatch < ActiveRecord::Migration[5.1]
  def change
     change_column :matches, :request_time1, 'datetime USING CAST(request_time1 AS datetime)'
     change_column :matches, :request_time2, 'datetime USING CAST(request_time2 AS datetime)'
     change_column :matches, :request_time3, 'datetime USING CAST(request_time3 AS datetime)'
     change_column :matches, :appoint_time, 'datetime USING CAST(appoint_time AS datetime)'
  end
end
