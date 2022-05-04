class Task < ApplicationRecord
  belongs_to :user

  enum status: { "new_task": 1, "in_progress": 2, "done": 3, "backlog": 4 }
  
  def self.except_done_tasks
    where.not(status: 'done')
  end

  scope :backlog, ->  {where(status: statuses[:backlog])}
  scope :in_progress, ->  {where(status: statuses[:in_progress])}
  scope :done, ->  {where(status: statuses[:done])}
  scope :next_day_and_hour_tasks, -> {where("Date(deadline) = ?", DateTime.now + 1.day + 1.hour)} 
  
  validates :title, :description, :deadline, presence: true
  
  before_save :set_backlog_status

  def set_backlog_status
    self.status = Task::statuses[:backlog] if deadline < DateTime.now
  end
end
