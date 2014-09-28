class CreatePendingWorks < ActiveRecord::Migration
  def change
    create_table :pending_works do |t|
      t.datetime :starting_time
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.text :description
      t.integer :cumulative_minutes

      t.timestamps
    end
  end
end
