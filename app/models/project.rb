class Project < ActiveRecord::Base
  has_many :work_hours
  has_many :users, :through => :work_hours
end
