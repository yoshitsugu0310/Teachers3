class AddDataToMatch < ActiveRecord::Migration[5.1]
  def change
     change_column :matches, :request_time1, 'timestamp without time zone USING CAST(request_time1 AS timestamp without time zone)'
     change_column :matches, :request_time2, 'timestamp without time zone USING CAST(request_time2 AS timestamp without time zone)'
     change_column :matches, :request_time3, 'timestamp without time zone USING CAST(request_time3 AS timestamp without time zone)'
     change_column :matches, :appoint_time,  'timestamp without time zone USING CAST(appoint_time AS timestamp without time zone)'
  end
end
