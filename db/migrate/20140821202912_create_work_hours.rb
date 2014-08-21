class CreateWorkHours < ActiveRecord::Migration
  def change
    create_table :work_hours do |t|
      t.date :work_date
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
