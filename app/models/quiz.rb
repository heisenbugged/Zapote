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
  has_many :tags, :as => :taggable

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
  def has_tag?(name)
    tags.where(:name => name).count > 0
  end
  def self.tag_search(search)
    if search
      Quiz.all.collect { |quiz| quiz if quiz.has_tag?(search) }.compact      
    else
      scoped
    end
  end

end
