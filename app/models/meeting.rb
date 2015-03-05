class Meeting < ActiveRecord::Base

  validates :group_involved, presence: true, length: { minimum: 1, maximum: 10 }
  validates :meeting_created_by, presence: true, length: { minimum: 9, maximum: 9 }
  validates :meeting_name, presence: true, length: { minimum: 2, maximum: 40 }
  validates :agenda, presence: true, length: { minimum: 5, maximum: 60 }
  validates :memberID1, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID2, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID3, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID4, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID5, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID6, presence: true, length: { minimum: 9, maximum: 9 }
  validate :unique_name

  validate :unique_start_time
  validate :meeting_overlap

  def unique_start_time
    self.errors.add(:start_time, 'is already taken by a meeting') if Meeting.where(start_time: self.start_time).exists?
    self.errors.add(:start_time, 'is already taken by an event') if Event.where(start_time: self.start_time).exists?
    self.errors.add(:start_time, 'is already taken by a module') if Coursemodule.where(start_time: self.start_time).exists?
  end

  def meeting_overlap

    self.errors.add(:start_time, 'There is an overlap with another event.') if Event.where({start_time: (self.start_time)..(self.end_time)}).exists?
    self.errors.add(:start_time, 'There is an overlap with another event.') if Event.where('? > start_time AND ? <= end_time', self.start_time,self.start_time).exists?

    self.errors.add(:start_time, 'There is an overlap with a meeting.') if Meeting.where({start_time: (self.start_time)..(self.end_time)}).exists?
    self.errors.add(:start_time, 'There is an overlap with a meeting') if Meeting.where('? > start_time AND ? <= end_time', self.start_time,self.start_time).exists?

    self.errors.add(:start_time, 'There is an overlap with module.') if Coursemodule.where({start_time: (self.start_time)..(self.end_time)}).exists?
    self.errors.add(:start_time, 'There is an overlap with module') if Coursemodule.where('? > start_time AND ? <= end_time', self.start_time,self.start_time).exists?

  end
end

