class Beneficiary < ActiveRecord::Base
  has_and_belongs_to_many :resources
  has_many :events
  has_many :activities

  validates :cedula, :first_name, :last_name, :phone, :position, presence: true
  validates :cedula, :uniqueness => { :case_sensitive => false }

  before_save :up_case_cedula
  
  def up_case_cedula
    cedula.upcase!
  end

  def complete_name
    first_name + ' ' + last_name
  end

end
