class Beneficiary < ActiveRecord::Base
  has_and_belongs_to_many :resources
  has_many :events
  has_many :activities

  def complete_name
    first_name + ' ' + last_name
  end
end
