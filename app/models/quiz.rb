class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope asc(:lowercase_title)
  validates_presence_of :title
  before_save :store_lowercase_title

  field :title
  field :lowercase_title
  has_many :questions  

  def store_lowercase_title
    self.lowercase_title = title.downcase
  end
end
