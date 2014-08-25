class Project < ActiveRecord::Base
  has_many :work_hours
  has_many :users, through: :work_hours

  def worked_hours(user = nil)
    if user == nil
      worked_hours = WorkHour.find(:all, :conditions => ['project_id', self.id])
    else
      worked_hours = WorkHour.find(:all, :conditions => ['user_id = ? AND project_id = ?', user.id, self.id])
    end
    total = 0
    worked_hours.each {|wh| total += wh.quantity }
    total
  end  
end
