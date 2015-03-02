class Event < ActiveRecord::Base
  belongs_to :user


  validates :start_time, uniqueness: true
  validate :unique_start_time

  def unique_start_time
    self.errors.add(:start_time, 'is already taken by a meeting') if Meeting.where(start_time: self.start_time).exists?
  end

end
