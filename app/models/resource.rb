class Resource < ActiveRecord::Base
  has_enumeration_for :status, with: ResourceStatus, create_scopes: true, create_helpers: true
  
  validates :name, :code, :description, presence: true, on: :create
  
  has_many :resources, dependent: :delete_all
  
  belongs_to :resource
  belongs_to :type_resource
  belongs_to :area
  has_and_belongs_to_many :beneficiaries
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :events

  accepts_nested_attributes_for :resources, reject_if: :all_blank, allow_destroy: true

  has_many :activities_resources
  has_many :activities, through: :activities_resources
  
  scope :padres, -> {
    where(resource_id: nil)
  }

  before_create :normalize_code

  scope :available, -> { where(status: ResourceStatus::AVAILABLE) }
  scope :maintenance, -> { where(status: ResourceStatus::MAINTENANCE) }
  scope :disjointed, -> { where(status: ResourceStatus::DISJOINTED) }
  scope :movil, -> { where(movil: true) }
  scope :fijo, -> { where(movil: false) }

  scope :disponible, -> { available.movil }

  def normalize_code
    self.code = "#{area.code}-#{self.code}"
  end

end
