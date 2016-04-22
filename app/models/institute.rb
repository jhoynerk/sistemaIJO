class Institute < ActiveRecord::Base
  validates :name, :code, presence: true
  has_many :areas, dependent: :delete_all

  validates :code, :uniqueness => { :case_sensitive => false }
  #before_save :capitalize_name
  before_save :up_case_code
  
  def up_case_code
    code.upcase!
  end

  def capitalize_name
    name.capitalize!
  end
end
