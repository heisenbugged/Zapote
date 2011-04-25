class DictationQuestion < Question
  field :answer
  
  validates_presence_of :answer
  validates_presence_of :audio

  def type
    "Dictation"
  end
end
