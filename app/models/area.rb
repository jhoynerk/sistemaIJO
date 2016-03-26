class Area < ActiveRecord::Base
  belongs_to :institute
  has_many :resources, dependent: :delete_all
end
