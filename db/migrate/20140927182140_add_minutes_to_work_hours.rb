class AddMinutesToWorkHours < ActiveRecord::Migration
  def change
    add_column :work_hours, :minutes, :integer
  end
end
