class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :work_hours
  has_many :projects,  -> { uniq }, through: :work_hours

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def worked_hours(project = nil)
    if project == nil
      worked_hours = WorkHour.find(:all, :conditions =>['user_id = ?', self.id])
    else
      worked_hours = WorkHour.find(:all, :conditions => ['user_id = ? AND project_id = ?', self.id, project.id])
    end
    total = 0
    worked_hours.each {|wh| total += wh.total_minutes }
    total
  end  
end
