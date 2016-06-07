require 'rails_helper'

def freeze_time(time = "12:00")
  before do
    Timecop.freeze(Time.parse(time))
  end
  
  after do
    Timecop.return
  end
end

describe Opening, :type => :model do
  let(:o){ build :opening }
  let(:day){ Date.today.strftime('%A') }
    
  describe 'Validations' do
    it{ should validate_presence_of :day_of_week }
    it{ should validate_inclusion_of(:day_of_week).in_array(Date::DAYNAMES) }
    
    it{ should validate_presence_of :open_time }
    it{ should validate_presence_of :close_time }
  end
  
  describe 'Associations' do
    it{ should belong_to :open_and_close }
  end
  
  describe 'Attributes' do
    describe '#open_time' do
      freeze_time
      
      it 'should return the open_time TODAY, regardless of for what day it was set' do
        # same with close_time
        
        o.open_time = Time.now - 1.day
        o.open_time.strftime('%A').should == Date.today.strftime('%A')
      end
    end #open_time
#     
    # describe '#day_of_week=(val)' do
      # it 'Should save as '
    # end
  end
  
  describe 'Methods' do
    describe '#open?(tz: nil)' do
      describe '#is_open_over_midnight?' do
        # private method to determine if close_time refers to that day, or the next 

        freeze_time
        
        it 'should return false if open_time is less than close_time' do
          o.open_time = Time.now
          o.close_time = Time.now + 10.minutes
          o.send(:is_open_over_midnight?).should == false
        end
        
        it 'should return true if open_time is before close_time' do
          o.close_time = Time.now
          o.open_time = Time.now + 10.minutes
          o.send(:is_open_over_midnight?).should == true
        end
      end #is_open_over_midnight?
      
      describe '#is_open_over_midnight == false' do
        freeze_time
        
        it 'should return true if open_time is less than current time AND close_time is before current time' do
          o.day_of_week = day
          o.open_time = Time.now - 10.minutes
          o.close_time = Time.now + 10.minutes
          
          o.open?.should == true
        end
      end
      
      describe '#is_open_over_midnight == true' do
        describe 'Before Midnight' do
          it '#open should return true if the Opening :day_of_week = today, and :open_time < Current Time' do
            o.open_time = Time.now - 1.hour
            o.close_time = Time.now - 2.hours
            o.day_of_week = day
            o.open?.should == true
          end
        end
        
        describe 'After Midnight' do
          it '#open should return true if the Opening :day_of_week == yesterday, and :close_time is < Current Time' do
            o.open_time = Time.now + 2.hours
            o.close_time = Time.now + 1.hour
            o.day_of_week = (Date.today - 1.day).strftime('%A')
            
            o.open?.should == true
          end
        end
      end
      
    end #open?
  end # Methods
  
  describe 'On a Model' do
    # Uses generic Model called Obj
    let(:obj){ build :obj }
    describe '#is_open?' do
      freeze_time
      
      it 'should return false if no Opening exists that passes #open?' do
        obj.is_open?.should == false
      end
      
      it 'should return true if an Opening object exists on the Association where #open evaluates to true' do
        o.open_time = Time.now - 1.hour
        o.close_time = Time.now + 1.hour
        o.day_of_week = Time.now.strftime('%A')
        
        obj.openings << o
        obj.is_open?.should == true
      end
    end
  end
end
