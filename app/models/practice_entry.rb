class PracticeEntry
  include Mongoid::Document
  
  belongs_to :user
  validates_presence_of :hours, :date
  field :hours, :tyoe => BigDecimal
  field :date, :type => Date
  
end