module Aux

  def format_time(total_minutes)
    hours = total_minutes/60
    minutes = total_minutes%60
    return format("%02d:%02d", hours, minutes) 
  end
end
