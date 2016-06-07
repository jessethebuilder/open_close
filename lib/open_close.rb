require "open_close/engine"

def use_open_close
  self.class_eval do
    has_many :openings, :as => :open_and_close
  end
  
  self.instance_eval do
    include OpeningsModelHelper
  end      


  
end

module OpeningsModelHelper
  def is_open?(tz: nil)
    self.openings.each do |o|
      return true if o.open?(:tz => tz)
    end
    
    false
  end
end