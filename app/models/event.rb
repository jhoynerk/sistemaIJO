class Event < ActiveRecord::Base
  validates :description, presence: true

  has_many :activities, dependent: :delete_all
  belongs_to :beneficiary
  accepts_nested_attributes_for :activities, reject_if: :all_blank, allow_destroy: true

  has_and_belongs_to_many :resources

  scope :not_beneficiary, -> {
    where(beneficiary_id: nil)
  }
end
