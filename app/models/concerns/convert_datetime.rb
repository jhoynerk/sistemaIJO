module ConvertDatetime
  def start_date_field
    date_start.strftime("%Y-%m-%d") if date_start.present?
  end 

  def start_time_field
    date_start.strftime("%H:%M:%S") if date_start.present?
  end

  def start_date_field=(date)
    # Change back to datetime friendly format
    @start_date_field = Date.parse(date).strftime("%Y-%m-%d") unless date.empty?
  end

  def start_time_field=(time)
    # Change back to datetime friendly format
    @start_time_field = Time.parse(time).strftime("%H:%M:%S") unless time.empty?
  end

  def convert_to_datetime_start
    if date_start.present?
      self.start_date_field = date_start.to_s
      self.start_time_field = date_start.to_s
    end
    self.date_start = DateTime.parse("#{@start_date_field} #{@start_time_field}") unless @start_date_field.nil? && @start_time_field.nil?
  end

  def end_date_field
    date_end.strftime("%Y-%m-%d") if date_end.present?
  end 

  def end_time_field
    date_end.strftime("%H:%M:%S") if date_end.present?
  end

  def end_date_field=(date)
    # Change back to datetime friendly format
    @end_date_field = Date.parse(date).strftime("%Y-%m-%d") unless date.empty?
  end

  def end_time_field=(time)
    # Change back to datetime friendly format
    @end_time_field = Time.parse(time).strftime("%H:%M:%S") unless time.empty?
  end

  def convert_to_datetime_end
    if date_end.present?
      self.end_date_field = date_end.to_s
      self.end_time_field = date_end.to_s
    end
    self.date_end = DateTime.parse("#{@end_date_field} #{@end_time_field}") unless @end_date_field.nil? && @end_time_field.nil?
  end
end
