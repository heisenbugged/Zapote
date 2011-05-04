class Tag
  include Mongoid::Document
  field :name
  field :type
  index :type
  before_create :save_type
  validates_presence_of :name
  belongs_to :taggable, :polymorphic => :true
  def save_type
    self.type = taggable.class.to_s.downcase
  end
end
