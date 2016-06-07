class Opening < ActiveRecord::Base

  belongs_to :open_and_close, :polymorphic => true
  
  validates :day_of_week, :presence => true, :inclusion => {:in => Date::DAYNAMES}
  
  validates :open_time, :presence => true
  validates :close_time, :presence => true
  
  def now(tz: nil)
    if tz
      Time.in_time_zone(tz).now
    else
      Time.now
    end
  end

  def open_time
    t = read_attribute(:open_time)
    t.nil? ? nil : Time.parse(t.strftime('%k:%M %z'))
  end
  
  def close_time
    t = read_attribute(:close_time)
    t.nil? ? nil : Time.parse(t.strftime('%k:%M %z')) 
  end
  
  def open?(tz: nil)
    t = now(:tz => tz)
    day = t.strftime('%A')
    
    if is_open_over_midnight?
      day == self.day_of_week && t >= self.open_time || ((t - 1.day).strftime('%A') == self.day_of_week  && t < self.close_time)
    else
      day == self.day_of_week && t >= self.open_time && t < self.close_time  
    end
  end
  
  private 
  
  def is_open_over_midnight?
    open_time >= close_time
  end
end
