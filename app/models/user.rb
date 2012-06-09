class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  field :admin, :type => Boolean, :default => false
  field :full_name
  has_many :statistics
  has_many :practice_entries
  validates_presence_of :full_name

  def average_score
    if(statistics.count > 0)
      percent_sum = 0
      statistics.select {|statistic| percent_sum += statistic.percent }
      (percent_sum/statistics.count).to_i
    else
      100
    end
  end
  def total_questions_answered
    answered = 0
    statistics.select {|statistic| answered += statistic.questions_right + statistic.questions_wrong}
    answered
  end
  def total_questions_right
    answered = 0
    statistics.select {|statistic| answered += statistic.questions_right }
    answered
  end
  def total_questions_wrong
    answered = 0
    statistics.select {|statistic| answered += statistic.questions_wrong }
    answered
  end
end
