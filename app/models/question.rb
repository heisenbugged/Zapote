require 'carrierwave/orm/mongoid'
class Question
  #Question type constants
  MULTIPLE_CHOICE = "MultipleChoiceQuestion"
  DICTATION = "DictationQuestion"
  TEXT = "TextQuestion"
  VALID_TYPES = [MULTIPLE_CHOICE, DICTATION, TEXT]
  
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :title

  default_scope asc(:created_at)
  before_save :store_lowercase_title
  field :title
  field :lowercase_title
  belongs_to :quiz
  mount_uploader :audio, AudioUploader
  mount_uploader :image, ImageUploader
  def store_lowercase_title
    self.lowercase_title = title.downcase
  end
end
