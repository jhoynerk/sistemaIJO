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
end
