class Resource < ActiveRecord::Base
  validates :name, :code, :capacity, :area_id, presence: true
  
  has_many :resources, dependent: :delete_all
  accepts_nested_attributes_for :resources, reject_if: :all_blank, allow_destroy: true
  
  belongs_to :resource
  belongs_to :area
  has_and_belongs_to_many :beneficiaries
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :events

  scope :padres, -> {
    where(resource_id: nil)
  }

end
