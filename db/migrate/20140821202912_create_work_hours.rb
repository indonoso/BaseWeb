class CreateWorkHours < ActiveRecord::Migration
  def change
    create_table :work_hours do |t|
      t.date :work_date
      t.integer :hours
      t.integer :minutes
      t.string :lala1
      t.integer :lala2
      t.text :description
      t.belongs_to :user
      t.belongs_to :project

      t.timestamps
    end
  end
end
