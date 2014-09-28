class PendingWork < ActiveRecord::Base
  belongs_to :user
  belongs_to :project


  def elapsed_time
    elapsed = (Time.now - starting_time)/60

    elapsed += cumulative_minutes
    elapsed.to_int
  end
end
