class TextQuestion < Question
  field :answer

  validates_presence_of :answer


  def type
    "Freeform"
  end
end
