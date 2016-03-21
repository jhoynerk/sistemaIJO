class Institute < ActiveRecord::Base
  validates :name, :code, presence: true
end
