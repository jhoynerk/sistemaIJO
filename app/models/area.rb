class Area < ActiveRecord::Base
  has_enumeration_for :status, with: AreaStatus, create_scopes: true, create_helpers: true
  
  has_many :areas, dependent: :delete_all
  has_many :resources, -> { order(:code) }, dependent: :delete_all
  has_many :activities, dependent: :delete_all

  belongs_to :institute
  belongs_to :area

  accepts_nested_attributes_for :resources, reject_if: :all_blank, allow_destroy: true

  scope :available, -> { where(status: AreaStatus::AVAILABLE) }
  scope :maintenance, -> { where(status: AreaStatus::MAINTENANCE) }
  scope :disjointed, -> { where(status: AreaStatus::DISJOINTED) }
  scope :reservable, -> { where(reservable: true) }

  scope :disponible, -> { reservable.available }

  before_save :up_case_code
  before_create :normalize_code

  validates :name, :code, :institute_id, presence: true
  validates :code, :uniqueness => { :case_sensitive => false }

  
  def normalize_code
    self.code = "#{institute.code}-#{self.code}" if institute.present?
  end
  
  def up_case_code
    code.upcase!
  end
end
