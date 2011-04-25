require 'carrierwave/orm/mongoid'
class Question
  #Question type constants
  MULTIPLE_CHOICE = "MultipleChoiceQuestion"
  DICTATION = "DictationQuestion"
  VALID_TYPES = [MULTIPLE_CHOICE, DICTATION]
  
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :title
  
  field :title
  belongs_to :quiz
  
  mount_uploader :audio, AudioUploader
end
