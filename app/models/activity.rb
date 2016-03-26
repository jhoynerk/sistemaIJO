class Activity < ActiveRecord::Base
  include ConvertDatetime
  before_save :convert_to_datetime_start, :convert_to_datetime_end
  validates :code, :description, presence: true
  belongs_to :event
  belongs_to :beneficiary
  has_and_belongs_to_many :resources

  def start_time
      self.date_start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def end_time
      self.date_end ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
