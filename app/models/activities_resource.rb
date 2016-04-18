class ActivitiesResource < ActiveRecord::Base
  belongs_to :activities
  belongs_to :resources
end
