class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope asc(:lowercase_title)
  validates_presence_of :title
  validates_presence_of :number, :if => :persisted?
  before_create :generate_number
  before_save :store_lowercase_title

  field :title
  field :lowercase_title
  #integer unique identifier
  field :number, :type => Integer
  index :number

  has_many :questions  

  def store_lowercase_title
    self.lowercase_title = title.downcase
  end

  def number= number
    write_attribute(:number, number)
  end

  def generate_number
    last_quiz_number = Quiz.max(:number).to_i
    self.number = last_quiz_number ? (last_quiz_number + 1) : 1
  end

end
