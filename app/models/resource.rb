class Resource < ActiveRecord::Base
  has_many :resources
  accepts_nested_attributes_for :resources, reject_if: :all_blank, allow_destroy: true
  belongs_to :resource
end
