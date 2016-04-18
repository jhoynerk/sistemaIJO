# Date Time class
class DateTime

  # weekday format
  def weekday
    strftime('%w')
  end

  # hour_minutes format
  def hour_minutes
    strftime('%H:%M')
  end

  # hour minutes am/pm
  def hour_am_pm
    strftime('%I:%M%P')
  end

  # format normal date
  def normal_date
    strftime('%Y-%m-%d')
  end
end
