class AddDataToMatch < ActiveRecord::Migration[5.1]
  def change
     change_column :matches, :request_time1, "USING request_time1::timestamp without time zone"
     change_column :matches, :request_time2, "USING request_time2::timestamp without time zone"
     change_column :matches, :request_time3, "USING request_time3::timestamp without time zone"
     change_column :matches, :appoint_time,  "USING appoint_time::timestamp without time zone"
  end
end
