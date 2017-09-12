class Match < ApplicationRecord
include DatetimeIntegratable

  integrate_datetime_fields :request_time1

  validates :request_time1_date, presence: true
  validates :request_time1_hour, presence: true
  validates :request_time1_minute, presence: true

  integrate_datetime_fields :request_time2



  validates :request_time2_date, presence: true
  validates :request_time2_hour, presence: true
  validates :request_time2_minute, presence: true


  integrate_datetime_fields :request_time3
  


  validates :request_time3_date, presence: true
  validates :request_time3_hour, presence: true
  validates :request_time3_minute, presence: true

end
