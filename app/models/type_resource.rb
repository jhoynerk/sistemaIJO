class TypeResource < ActiveRecord::Base
  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true

  has_many :resources

  before_save :up_case_code
  
  def up_case_code
    code.upcase!
  end
end

