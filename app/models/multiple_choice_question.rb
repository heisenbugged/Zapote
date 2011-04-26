class MultipleChoiceQuestion < Question  
  embeds_many :choices, :as => :answerable
  def type
    "Multiple Choice"
  end
  #returns true if there is more than one correct response
  def multiple_response?
    correct=0
    choices.map { |choice| correct+=1 if choice.correct }          
    correct > 1
  end
  def choices=(choices,hash=nil)
    choices.each do |choice|
      self.choices.build(choice)
    end
  end
end
