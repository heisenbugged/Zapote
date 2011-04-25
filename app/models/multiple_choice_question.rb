class MultipleChoiceQuestion < Question  
  embeds_many :choices, :as => :answerable
  def type
    "Multiple Choice"
  end

  def choices=(choices,hash=nil)
    choices.each do |choice|
      self.choices.build(choice)
    end
  end
end
