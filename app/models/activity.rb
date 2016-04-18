class Activity < ActiveRecord::Base
  has_enumeration_for :status, with: ActivityStatus, create_scopes: true, create_helpers: true
  belongs_to :event
  belongs_to :beneficiary
  belongs_to :area
  has_many :activities_resources
  has_many :categories, through: :activities_resources
  accepts_nested_attributes_for :activities_resources

  validates :description, :beneficiary_id, :day, :time_start, :time_end, :area_id, presence: true
  validate :end_time_greater_start_time, :calendar_available

  scope :blocks_unavailable, -> (time_start, time_end, day) { 
      where('((time_start::time between ? and ? or time_end::time between ? and ?) or (time_start::time < ? and time_end::time > ?) or (time_start::time > ? and time_end::time < ?) and day = ?)',
       (time_start + 1.minute).to_datetime.hour_minutes,
       (time_end -1.minute).to_datetime.hour_minutes,
       (time_start + 1.minute).to_datetime.hour_minutes,
       (time_end -1.minute).to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       day)
    }


  scope :not_id, -> (id) { where('id != ?', id) }
  # check end time greater start time
  def end_time_greater_start_time
    return nil unless time_start && time_end
    if time_start.to_time > time_end.to_time
      errors.add(:time_start, 'debe ser menor a la hora final')
    end
  end

  # caliendario disponible
  def calendar_available
    if self.id.present?
      a = Activity.blocks_unavailable(time_start, time_end, day).not_id(id)
    else
      a = Activity.blocks_unavailable(time_start, time_end, day)
    end
    if a.count > 0
      errors.add(:day, 'ya tiene otra actividad asignada')
    end
  end
end
