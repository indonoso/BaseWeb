class WorkHour < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
  validates :project, presence: true

  def total_minutes
    res = 0
    if hours
      res += hours*60
    end
    if minutes
      res += minutes
    end
    return res
  end
end