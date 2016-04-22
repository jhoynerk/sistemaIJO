class Activity < ActiveRecord::Base
  has_enumeration_for :status, with: ActivityStatus, create_scopes: true, create_helpers: true
  belongs_to :event
  belongs_to :beneficiary
  belongs_to :area
  has_and_belongs_to_many :resources
  #accepts_nested_attributes_for :activities_resources
  has_one :incidence

  validates :description, :beneficiary_id, :day, :time_start, :time_end, :area_id, presence: true
  validate :end_time_greater_start_time, :calendar_available_area, :calendar_available_resource

  scope :blocks_unavailable, -> (time_start, time_end, day) { 
      where('(((time_start::time between ? and ? or time_end::time between ? and ?) 
            or (time_start::time < ? and time_end::time > ?) 
            or (time_start::time > ? and time_end::time < ?) 
            or (time_start::time = ? and time_end::time = ?) 
            or (time_start::time = ? and time_end::time < ?) 
            or (time_start::time = ? and time_end::time > ?) 
            or (time_start::time < ? and time_end::time = ?) 
            or (time_start::time > ? and time_end::time = ?)) and day = ?)',
       (time_start + 1.minute).to_datetime.hour_minutes,
       (time_end -1.minute).to_datetime.hour_minutes,
       (time_start + 1.minute).to_datetime.hour_minutes,
       (time_end -1.minute).to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       time_start.to_datetime.hour_minutes,
       time_end.to_datetime.hour_minutes,
       day)
  }

  scope :date_expired, -> { where('day <= ?', Date.today) }

  scope :pendings, -> { where(status: ActivityStatus::PENDING) }
  scope :process, -> { where(status: ActivityStatus::CURRENT) }
  scope :done, -> { where(status: ActivityStatus::DONE) }
  scope :suspended, -> { where(status: ActivityStatus::SUSPENDED) }

  scope :pendings_and_process, -> { where('status = ? or status = ?', ActivityStatus::PENDING, ActivityStatus::CURRENT) }

  def opening_time
    self.time_start.to_time.strftime('%I:%M%P') if self.time_start.present?
  end

  def close_time
    self.time_end.to_time.strftime('%I:%M%P') if self.time_end.present?
  end

  def start_time
    self.time_start
  end

  def end_time
    self.time_end
  end

  def inicio
    time_start.to_datetime.hour_minutes
  end

  def fin
    time_end.to_datetime.hour_minutes
  end

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
  end

  # para area
  def calendar_available_area
    a = calendar_available
    if a.count > 0
      if a.where(area_id: area_id).count > 0
        a = a.where(area_id: area_id).last
        errors.add(:area_id, "ya está ocupada para el día #{a.day} a las #{a.time_start.to_time.strftime('%I:%M%P')} hasta las #{a.time_end.to_time.strftime('%I:%M%P')}")
      end
    end
  end

  # para recurso
  def calendar_available_resource
    a = calendar_available
      if a.count > 0 && self.resources.any?
        a.each do |activity|
          activity.resources.each  do |resource|
            self.resources.each do |r|
              errors.add(:activities_resources, " ya está ocupado para la fecha #{self.day} a las #{activity.time_start.to_time.strftime('%I:%M%P')} hasta las #{activity.time_end.to_time.strftime('%I:%M%P')}") if resource.id == r.id
            end
          end
        end
      end
  end

end
