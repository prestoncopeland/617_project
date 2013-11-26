class TutionSession < ActiveRecord::Base

  belongs_to :user
  has_one :private_forum, :dependent => :destroy

  attr_accessor :start_time_date, :start_time_date, :start_time_time, :end_time_date, :end_time_time

  before_save :set_start_time, :set_end_time

  def set_start_time
    if start_time_date and start_time
      day = Date.strptime(self.start_time_date, "%m/%d/%Y")
      self.start_time = self.start_time.change(:year => day.year, :month => day.month, :day => day.day)
    end
  end 

  def set_end_time
    if end_time_date and end_time
      day = Date.strptime(self.end_time_date, "%m/%d/%Y")
      self.end_time = self.end_time.change(:year => day.year, :month => day.month, :day => day.day)
    end
  end

  def get_start_time
    self.start_time_date = start_time.strftime("%m/%d/%Y") if start_time
  end

  def get_end_time
    self.end_time_date = end_time.strftime("%m/%d/%Y") if end_time
  end
end
