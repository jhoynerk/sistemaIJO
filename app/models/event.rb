class Event < ActiveRecord::Base
  include ConvertDatetime
  before_save :convert_to_datetime_start, :convert_to_datetime_end
  validates :code, :description, presence: true

  has_many :activities, dependent: :delete_all
  belongs_to :beneficiary
  accepts_nested_attributes_for :activities, reject_if: :all_blank, allow_destroy: true

  has_and_belongs_to_many :resources

  scope :not_beneficiary, -> {
    where(beneficiary_id: nil)
  }
  
  def start_time
      self.date_start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def end_time
      self.date_end ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def duration
    end_time - start_time
  end

end
