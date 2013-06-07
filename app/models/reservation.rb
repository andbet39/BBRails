class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :customer
  attr_accessible :end_date, :start_date ,:room_id, :customer_id


  scope :before, lambda {|end_date| {:conditions => ["end_date < ?", Reservation.format_date(end_date)] }}
  scope :after, lambda {|start_date| {:conditions => ["start_date > ?", Reservation.format_date(start_date)] }}
  
 
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.customer.last_name << " " << self.customer.name,
      :description => self.room.name || "",
      :start => start_date.rfc822,
      :end => end_date.rfc822,
      :allDay => true,
      :recurring => false,
      :color => self.room.uicolor,
      :url => Rails.application.routes.url_helpers.reservation_path(id)
    }
    
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
end
