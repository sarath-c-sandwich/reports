class Listing < ActiveRecord::Base
  establish_connection("remote_database")

  def self.total_customers_by_date(start_date, end_date)
    where(created_at: start_date..end_date)
  end
end
