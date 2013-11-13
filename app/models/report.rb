class Report < ActiveRecord::Base
  attr_accessor :start_date, :end_date

  def self.r_customer_by_date(start_date, end_date)
    Listing.total_customers_by_date(start_date, end_date) if start_date.present?
  end
end
