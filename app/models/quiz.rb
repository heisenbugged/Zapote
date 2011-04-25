class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :title

  field :title
  has_many :questions  
end
