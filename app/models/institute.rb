class Institute < ActiveRecord::Base
  validates :name, :code, presence: true
  has_many :areas, dependent: :delete_all
end
