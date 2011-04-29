class Statistic
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  field :percent, :type => Integer
  field :questions_right, :type => Integer
  field :questions_wrong, :type => Integer
  
  validates_presence_of :percent, :questions_right, :questions_wrong
end
