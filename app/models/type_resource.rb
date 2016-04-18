class TypeResource < ActiveRecord::Base
  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true

  has_many :resources
end

