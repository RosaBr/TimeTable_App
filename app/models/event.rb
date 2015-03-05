class Event < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 4}
  validates :description, presence: true, length: { minimum: 4 }
  validate :unique_start_time
  validate :event_overlap

  def unique_start_time
    self.errors.add(:start_time, 'is already taken by a meeting') if Meeting.where(start_time: self.start_time).exists?
    self.errors.add(:start_time, 'is already taken by an event') if Event.where(start_time: self.start_time).exists?
    self.errors.add(:start_time, 'is already taken by a module') if Coursemodule.where(start_time: self.start_time).exists?
  end

  def event_overlap

    self.errors.add(:start_time, 'There is an overlap with another event.') if Event.where({start_time: (self.start_time)..(self.end_time)}).exists?
    self.errors.add(:start_time, 'There is an overlap with another event.') if Event.where('? > start_time AND ? <= end_time', self.start_time,self.start_time).exists?

    self.errors.add(:start_time, 'There is an overlap with a meeting.') if Meeting.where({start_time: (self.start_time)..(self.end_time)}).exists?
    self.errors.add(:start_time, 'There is an overlap with a meeting') if Meeting.where('? > start_time AND ? <= end_time', self.start_time,self.start_time).exists?

    self.errors.add(:start_time, 'There is an overlap with module.') if Coursemodule.where({start_time: (self.start_time)..(self.end_time)}).exists?
    self.errors.add(:start_time, 'There is an overlap with module') if Coursemodule.where('? > start_time AND ? <= end_time', self.start_time,self.start_time).exists?

  end


end
