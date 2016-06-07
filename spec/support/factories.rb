FactoryGirl.define do 
  factory :opening do
    day_of_week Date::DAYNAMES.sample
    open_time Time.parse("#{Random.rand(1..23)}:#{Random.rand(0..59)}")

    after(:build) do |o, e|
      o.close_time = o.open_time + Random.rand(1..23).hours + Random.rand(0..59).minutes
    end    
  end
  
  factory :obj do
    
  end
end